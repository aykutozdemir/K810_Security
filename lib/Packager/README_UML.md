# CRCPackageInterface Algorithm UML Diagram

This folder contains a PlantUML diagram (`CRCPackageInterface.uml`) that visualizes the algorithm flow of the `CRCPackageInterface` class.

## How to View the UML Diagram

There are several options for rendering the UML diagram:

### Option 1: Online PlantUML Server
1. Visit the [PlantUML Online Server](http://www.plantuml.com/plantuml/uml)
2. Copy and paste the contents of `CRCPackageInterface.uml` into the editor
3. The diagram will be automatically generated

### Option 2: IDE Plugins
Many IDEs have PlantUML plugins:

- **VS Code**: Install the "PlantUML" extension
- **Arduino IDE**: Use a browser to view the diagram using Option 1
- **IntelliJ/CLion**: Install the "PlantUML integration" plugin

### Option 3: Command Line
If you have Java installed:

1. Download PlantUML jar from [plantuml.com](https://plantuml.com/download)
2. Run: `java -jar plantuml.jar CRCPackageInterface.uml`
3. This will generate a PNG image

## Diagram Description

The UML diagram visualizes:

1. **State Machines**:
   - Outgoing channel state machine
   - Incoming channel state machine
   
2. **Processing Logic**:
   - Packet validation
   - Type-specific handling
   
3. **Reset Mechanisms**:
   - Manual reset via `sendResetPacket()`
   - Timeout-based reset
   - Sequence detection reset
   
This diagram helps understand how the communication protocol handles bidirectional communication between Arduino and Android, with a focus on the reset mechanism that ensures synchronization even after disconnections or app restarts.

## Modifying the Diagram

If you need to make changes to the algorithm, update both the code and the UML diagram to maintain accurate documentation. 