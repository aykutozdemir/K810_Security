package com.goldenhorn.k810security;

import android.Manifest;
import android.app.AlertDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothSocket;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresPermission;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;

import java.io.IOException;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MainActivity extends AppCompatActivity {

    // Region: Constants (application settings and Bluetooth parameters)
    private static final int PERMISSION_REQUEST_CODE = 1001;
    private static final String TAG = "MainActivity";
    private static final String TARGET_DEVICE_NAME = "K810";
    private static final UUID MY_UUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    private static final String PREFS_NAME = "MySecurePrefs";
    private static final long RECONNECT_DELAY_MS = 5000;
    private static final int STATE_CHECK_INTERVAL_MS = 3000;

    // Region: UI Components (views and controls)
    private View connectingMessage;
    private ImageButton lockButton, unlockButton;
    private Toast currentToast;
    private MenuItem bluetoothMenuItem;
    private TextView versionTextView;

    // Region: Bluetooth (adapter, device and socket management)
    private BluetoothAdapter bluetoothAdapter;
    private BluetoothDevice k810Device;
    private BluetoothSocket bluetoothSocket;
    private boolean isConnected = false;

    // Region: Threading (handler and executor for background tasks)
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Object connectionLock = new Object();

    // Region: Security (CRC interface and protocol state)
    private CRCPackageInterface crcInterface;
    private String stateResponse;
    private final Object threadLock = new Object();

    // Region: Broadcast Receiver (handles Bluetooth events)
    private final BroadcastReceiver bluetoothReceiver = new BroadcastReceiver() {
        @Override
        @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
        public void onReceive(Context context, Intent intent) {
            handleBluetoothEvent(intent);
        }
    };

    @Override
    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initializeUiComponents();
        showConnectingState(); // Added to display the connecting message initially
        initializeBluetooth();
        startPeriodicStateCheck();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        cleanupResources();
    }

    @Override
    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_bluetooth) {
            if (!isConnected) {
                attemptConnection();
            } else {
                showToast("Already connected", Toast.LENGTH_SHORT);
            }
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    // Region: Initialization Methods
    private void initializeUiComponents() {
        Toolbar toolbar = findViewById(R.id.toolbar);
        if (toolbar == null) {
            showToast("Toolbar not found", Toast.LENGTH_LONG);
            finish();
            return;
        }
        setSupportActionBar(toolbar);

        connectingMessage = findViewById(R.id.connecting_message);
        lockButton = findViewById(R.id.lock);
        unlockButton = findViewById(R.id.unlock);
        versionTextView = findViewById(R.id.version_text);

        unlockButton.setOnClickListener(v -> sendLockUnlockCommand("unlock"));
        lockButton.setOnClickListener(v -> sendLockUnlockCommand("lock"));
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void initializeBluetooth() {
        BluetoothManager bluetoothManager = (BluetoothManager) getSystemService(BLUETOOTH_SERVICE);
        bluetoothAdapter = bluetoothManager.getAdapter();

        if (bluetoothAdapter == null) {
            showToast("Bluetooth not supported", Toast.LENGTH_SHORT);
            finish();
            return;
        }

        if (!checkPermissions()) {
            requestPermissions();
            return;
        }

        registerBluetoothReceiver();
        attemptConnection();
    }

    private boolean checkPermissions() {
        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED ||
                ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED) {

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.BLUETOOTH_SCAN) ||
                    ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.BLUETOOTH_CONNECT)) {
                showPermissionRationaleDialog();
            } else {
                requestPermissions();
            }
            return false;
        }
        return true;
    }

    private void showPermissionRationaleDialog() {
        new AlertDialog.Builder(this)
                .setTitle("Permission Required")
                .setMessage("Bluetooth permissions are required to connect to the device.")
                .setPositiveButton("OK", (dialog, which) -> requestPermissions())
                .setNegativeButton("Cancel", (dialog, which) -> {
                    showToast("Permissions denied", Toast.LENGTH_SHORT);
                    finish();
                })
                .create()
                .show();
    }

    private void requestPermissions() {
        ActivityCompat.requestPermissions(this,
                new String[]{Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT},
                PERMISSION_REQUEST_CODE);
    }

    @Override
    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSION_REQUEST_CODE) {
            if (grantResults.length > 1 &&
                    grantResults[0] == PackageManager.PERMISSION_GRANTED &&
                    grantResults[1] == PackageManager.PERMISSION_GRANTED) {
                attemptConnection();
            } else {
                showToast("Permissions denied", Toast.LENGTH_SHORT);
                finish();
            }
        }
    }

    /** @noinspection BooleanMethodIsAlwaysInverted*/
    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private boolean hasBluetoothPermissions() {
        return ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_SCAN) == PackageManager.PERMISSION_GRANTED &&
                ActivityCompat.checkSelfPermission(this, Manifest.permission.BLUETOOTH_CONNECT) == PackageManager.PERMISSION_GRANTED;
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void tryBluetoothOperation(BluetoothOperation operation) {
        if (!hasBluetoothPermissions()) {
            requestPermissions();
            return;
        }
        try {
            operation.execute();
        } catch (SecurityException e) {
            Log.e(TAG, "Security exception during Bluetooth operation", e);
            showToast("Bluetooth permission denied", Toast.LENGTH_SHORT);
            requestPermissions();
        }
    }

    private interface BluetoothOperation {
        void execute() throws SecurityException;
    }

    // Region: Bluetooth Operations (discovery, connection, and reconnection)
    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void registerBluetoothReceiver() {
        tryBluetoothOperation(() -> {
            IntentFilter filter = new IntentFilter();
            filter.addAction(BluetoothDevice.ACTION_FOUND);
            filter.addAction(BluetoothDevice.ACTION_BOND_STATE_CHANGED);
            filter.addAction(BluetoothDevice.ACTION_ACL_DISCONNECTED);
            filter.addAction(BluetoothAdapter.ACTION_STATE_CHANGED);
            registerReceiver(bluetoothReceiver, filter);
        });
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void attemptConnection() {
        if (!hasBluetoothPermissions()) {
            requestPermissions();
            return;
        }

        if (!bluetoothAdapter.isEnabled()) {
            startActivity(new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE));
            return;
        }

        tryBluetoothOperation(() -> {
            Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
            for (BluetoothDevice device : pairedDevices) {
                if (TARGET_DEVICE_NAME.equals(device.getName())) {
                    connectToDevice(device);
                    return;
                }
            }
            startDiscovery();
        });
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void startDiscovery() {
        tryBluetoothOperation(() -> {
            if (bluetoothAdapter.isDiscovering()) {
                bluetoothAdapter.cancelDiscovery();
            }
            bluetoothAdapter.startDiscovery();
            showToast("Searching for " + TARGET_DEVICE_NAME + "...", Toast.LENGTH_SHORT);
        });
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void connectToDevice(BluetoothDevice device) {
        showConnectingState();
        executor.execute(() -> establishConnection(device));
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void establishConnection(BluetoothDevice device) {
        if (!hasBluetoothPermissions()) {
            mainHandler.post(() -> showToast("Bluetooth permission not granted", Toast.LENGTH_SHORT));
            requestPermissions();
            return;
        }
        synchronized (connectionLock) {
            try {
                BluetoothSocket socket = device.createRfcommSocketToServiceRecord(MY_UUID);
                socket.connect();
                // Save the socket for later cleanup
                bluetoothSocket = socket;
                initializeCrcInterface(socket);
                handleSuccessfulConnection(device);
            } catch (IOException e) {
                handleConnectionFailure(e);
            }
        }
    }

    private void initializeCrcInterface(BluetoothSocket socket) throws IOException {
        crcInterface = new CRCPackageInterface(socket.getInputStream(), socket.getOutputStream());
        crcInterface.setErrorCallback(error -> Log.e(TAG, "CRC Error: " + error));
        crcInterface.start();
        crcInterface.sendResetPacket();
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleSuccessfulConnection(BluetoothDevice device) throws IOException {
        // Initial handshake attempt
        boolean handshakeOk = performCrcHandshake();
        int attempts = 0;
        // Retry handshake up to 2 more times if needed
        while (!handshakeOk && attempts < 2) {
            try {
                Thread.sleep(1000); // Brief delay before retrying
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            crcInterface.sendResetPacket();
            handshakeOk = performCrcHandshake();
            attempts++;
        }
        final boolean finalHandshakeOk = handshakeOk;
        mainHandler.post(() -> {
            if (finalHandshakeOk) {
                isConnected = true;
                showToast("Connected to " + device.getName(), Toast.LENGTH_SHORT);
                handleStateResponse(stateResponse);
            } else {
                showToast("Connection failed", Toast.LENGTH_SHORT);
            }
            updateConnectionState(finalHandshakeOk);
        });
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleConnectionFailure(IOException e) {
        Log.e(TAG, "Connection failed", e);
        mainHandler.post(() -> {
            showToast("Connection failed", Toast.LENGTH_SHORT);
            updateConnectionState(false);
            attemptReconnect();
        });
        closeSocket();
    }

    private void closeSocket() {
        try {
            if (bluetoothSocket != null) {
                bluetoothSocket.close();
            }
        } catch (IOException e) {
            Log.e(TAG, "Error closing socket", e);
        }
    }

    // Region: UI State Management
    private void showConnectingState() {
        mainHandler.post(() -> {
            connectingMessage.setVisibility(View.VISIBLE);
            lockButton.setVisibility(View.GONE);
            unlockButton.setVisibility(View.GONE);
        });
    }

    private void updateConnectionState(boolean connected) {
        mainHandler.post(() -> {
            isConnected = connected;
            updateBluetoothMenu();
            connectingMessage.setVisibility(View.GONE);
            if (connected) {
                handleStateResponse(stateResponse);
            }
        });
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleBluetoothEvent(Intent intent) {
        String action = intent.getAction();
        if (action == null) return;

        switch (action) {
            case BluetoothDevice.ACTION_FOUND:
                handleDeviceFound(intent);
                break;
            case BluetoothDevice.ACTION_BOND_STATE_CHANGED:
                handleBondStateChange(intent);
                break;
            case BluetoothDevice.ACTION_ACL_DISCONNECTED:
                handleDisconnection(intent);
                break;
            case BluetoothAdapter.ACTION_STATE_CHANGED:
                handleAdapterStateChange(intent);
                break;
        }
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleDeviceFound(Intent intent) {
        BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
        if (device != null && TARGET_DEVICE_NAME.equals(device.getName())) {
            tryBluetoothOperation(() -> {
                if (bluetoothAdapter.isDiscovering()) {
                    bluetoothAdapter.cancelDiscovery();
                }
                k810Device = device;
                if (device.getBondState() != BluetoothDevice.BOND_BONDED) {
                    device.createBond();
                } else {
                    connectToDevice(device);
                }
            });
        }
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleBondStateChange(Intent intent) {
        BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
        if (device != null && TARGET_DEVICE_NAME.equals(device.getName()) &&
                device.getBondState() == BluetoothDevice.BOND_BONDED) {
            connectToDevice(device);
        }
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleDisconnection(Intent intent) {
        BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE, BluetoothDevice.class);
        if (device != null && TARGET_DEVICE_NAME.equals(device.getName())) {
            mainHandler.post(() -> {
                isConnected = false;
                updateBluetoothMenu();
                showToast("Disconnected", Toast.LENGTH_SHORT);
                showConnectingState();
            });
            attemptReconnect();
        }
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void handleAdapterStateChange(Intent intent) {
        int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, BluetoothAdapter.ERROR);
        if (state == BluetoothAdapter.STATE_OFF) {
            mainHandler.post(() -> {
                isConnected = false;
                updateBluetoothMenu();
                showToast("Bluetooth disabled", Toast.LENGTH_SHORT);
                closeSocket();
            });
        } else if (state == BluetoothAdapter.STATE_ON && !isConnected) {
            attemptConnection();
        }
    }

    // Region: Security Handshake (synchronizes with the device via commands)
    private boolean performCrcHandshake() {
        if (crcInterface == null) return false;

        String response = sendCommand("ping\r\n");
        if (isInvalidResponse(response, "pong")) return false;

        String versionResponse = sendCommand("version\r\n");
        if (versionResponse != null && versionResponse.contains("OK")) {
            runOnUiThread(() -> {
                versionTextView.setText(String.format(
                        "Version: %s", versionResponse.split("\\r\\n")[0].trim()));
                versionTextView.setVisibility(View.VISIBLE);
            });
        }

        response = sendCommand("state\r\n");
        if (response == null || (!response.contains("1") && !response.contains("0"))) return false;
        stateResponse = response;

        if (isHandshakeDone()) {
            Log.d(TAG, "Handshake already done");
            return true;
        }

        response = sendCommand("salt\r\n");
        if (response == null || !response.contains("OK")) return false;
        String salt = response.substring(0, 2);

        response = sendCommand("seed\r\n");
        if (response == null || response.length() < 32) return false;
        byte[] seed = decryptSeed(response.substring(0, 32), salt);

        response = sendCommand("check\r\n");
        if (isInvalidResponse(response, "OK")) return false;

        saveSecurityParameters(salt, seed);
        return true;
    }

    private byte[] decryptSeed(String encryptedSeedHex, String saltHex) {
        byte[] seedBytes = hexStringToByteArray(encryptedSeedHex);
        byte salt = (byte) Integer.parseInt(saltHex, 16);
        cypherDecryption(seedBytes, salt);
        return seedBytes;
    }

    private void saveSecurityParameters(String salt, byte[] seed) {
        SharedPreferences prefs = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);
        prefs.edit()
                .putString("salt", salt)
                .putString("seed", byteArrayToHexString(seed))
                .apply();
    }

    private boolean isHandshakeDone() {
        SharedPreferences prefs = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);
        return prefs.contains("salt") && prefs.contains("seed");
    }

    // Region: Command Handling (sends and processes commands via CRC interface)
    private String sendCommand(String command) {
        if (crcInterface == null) return null;

        Log.d(TAG, "Command: " + command.trim());
        crcInterface.clearData();
        crcInterface.sendData(command.getBytes(), command.length());
        return readResponse(3000);
    }

    /** @noinspection SameParameterValue*/
    private String readResponse(long timeout) {
        StringBuilder response = new StringBuilder();
        long startTime = System.currentTimeMillis();

        while (System.currentTimeMillis() - startTime < timeout) {
            byte[] data = crcInterface.readData();
            if (data != null) response.append(new String(data));
            if (response.toString().contains("OK\r\n")
                    || (response.toString().contains("ERROR: ")
                    && (response.toString().contains("\r\n")))) {
                break;
            }

            synchronized (threadLock) {
                try {
                    threadLock.wait(10);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        }

        Log.d(TAG, "Response: " + response.toString().trim());
        return response.toString();
    }

    private boolean isInvalidResponse(String response, String expected) {
        return response == null || !response.contains(expected) || !response.contains("OK");
    }

    public static byte[] hexStringToByteArray(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                    + Character.digit(s.charAt(i + 1), 16));
        }
        return data;
    }

    public static String byteArrayToHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X", b));
        }
        return sb.toString();
    }

    public static void cypherDecryption(byte[] data, byte salt) {
        if (data.length == 0) return;
        byte prev = data[0];
        data[0] ^= salt;
        for (int i = 1; i < data.length; i++) {
            byte temp = data[i];
            data[i] ^= prev;
            prev = temp;
        }
    }

    public static byte[] cypherEncryption(byte[] data, byte[] seed, byte salt) {
        if (data.length == 0 || seed.length == 0) return data;
        int seedOffset = (salt & 0xFF) % seed.length;
        byte prev = data[0];
        data[0] ^= seed[seedOffset];
        for (int i = 1; i < data.length; i++) {
            byte plaintext = data[i];
            data[i] = (byte) (plaintext ^ prev ^ seed[(i + seedOffset) % seed.length]);
            prev = plaintext;
        }
        return data;
    }

    // Region: Lock/Unlock Commands (executes security commands and updates UI)
    private void sendLockUnlockCommand(String command) {
        if (!isConnected) {
            showToast("Not connected", Toast.LENGTH_SHORT);
            return;
        }

        executor.execute(() -> {
            final String securityResponse = executeSecurityCommand(command);
            mainHandler.post(() -> handleCommandResponse(command, securityResponse));
            final String response = sendCommand("state\r\n");
            mainHandler.post(() -> handleStateResponse(response));
        });
    }

    private String executeSecurityCommand(String command) {
        SharedPreferences prefs = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);
        String saltHex = prefs.getString("salt", "");
        String seedHex = prefs.getString("seed", "");

        if (saltHex.isEmpty() || seedHex.isEmpty()) {
            return "ERROR: No security parameters";
        }

        byte[] salt = hexStringToByteArray(saltHex);
        byte[] seed = hexStringToByteArray(seedHex);
        byte[] encrypted = cypherEncryption(seed.clone(), seed, salt[0]);

        return sendCommand(command + " " + byteArrayToHexString(encrypted) + "\r\n");
    }

    private void handleCommandResponse(String command, String response) {
        if (response.contains("OK")) {
            showToast(command + " successful", Toast.LENGTH_SHORT);
        } else {
            showToast(command + " failed: " + response, Toast.LENGTH_LONG);
        }
    }

    // Region: State Management
    private void startPeriodicStateCheck() {
        mainHandler.postDelayed(new Runnable() {
            @Override
            public void run() {
                if (isConnected) {
                    executor.execute(() -> {
                        String response = sendCommand("state\r\n");
                        mainHandler.post(() -> handleStateResponse(response));
                    });
                }
                mainHandler.postDelayed(this, STATE_CHECK_INTERVAL_MS);
            }
        }, STATE_CHECK_INTERVAL_MS);
    }

    private void handleStateResponse(String response) {
        if (response == null) return;

        if (response.contains("1\r\n")) {
            lockButton.setVisibility(View.VISIBLE);
            unlockButton.setVisibility(View.GONE);
        } else if (response.contains("0\r\n")) {
            lockButton.setVisibility(View.GONE);
            unlockButton.setVisibility(View.VISIBLE);
        } else {
            Log.e(TAG, "Invalid state response: " + response);
        }
    }

    @RequiresPermission(allOf = {Manifest.permission.BLUETOOTH_SCAN, Manifest.permission.BLUETOOTH_CONNECT})
    private void attemptReconnect() {
        mainHandler.postDelayed(() -> {
            if (k810Device != null) {
                connectToDevice(k810Device);
            } else {
                startDiscovery();
            }
        }, RECONNECT_DELAY_MS);
    }

    // Region: Menu Handling
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        bluetoothMenuItem = menu.findItem(R.id.action_bluetooth);
        updateBluetoothMenu();
        return true;
    }

    private void updateBluetoothMenu() {
        mainHandler.post(() -> {
            if (bluetoothMenuItem == null) return;
            bluetoothMenuItem.setIcon(isConnected ?
                    R.drawable.ic_bluetooth_connected :
                    R.drawable.ic_bluetooth_disabled);
            bluetoothMenuItem.setTitle(isConnected ? "Connected" : "Disconnected");
        });
    }

    // Region: Cleanup (ensures proper resource release)
    private void cleanupResources() {
        try {
            unregisterReceiver(bluetoothReceiver);
            closeSocket();
            executor.shutdown();
            mainHandler.removeCallbacksAndMessages(null);
        } catch (Exception e) {
            Log.e(TAG, "Cleanup error", e);
        }
    }

    // Region: Toast Helper
    private void showToast(String message, int duration) {
        mainHandler.post(() -> {
            if (currentToast != null) currentToast.cancel();
            currentToast = Toast.makeText(this, message, duration);
            currentToast.show();
        });
    }
}

