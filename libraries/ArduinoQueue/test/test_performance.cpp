// Let Catch provide main():
#define CATCH_CONFIG_MAIN

#include <ArduinoQueue.h>

#include <catch2/catch.hpp>
#include <chrono>

TEST_CASE("Enqueue and dequeue performance", "[single-file]") {
  ArduinoQueue<int> ints;
  int64_t avgEnDuration = 0;
  int64_t avgDeDuration = 0;
  for (int j = 1; j <= 10; ++j) {
    auto begin = std::chrono::steady_clock::now();
    for (int i = 0; i < 1000000; ++i) {
      ints.enqueue(i);
    }
    auto end = std::chrono::steady_clock::now();

    auto duration =
        std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin)
            .count();
    avgEnDuration = avgEnDuration + ((duration - avgEnDuration) / i);

    begin = std::chrono::steady_clock::now();
    for (int k = 0; k < 1000000; ++k) {
      ints.dequeue();
    }
    end = std::chrono::steady_clock::now();

    duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin)
                   .count();
    avgDeDuration = avgDeDuration + ((duration - avgDeDuration) / i);
  }

  REQUIRE(avgEnDuration < 2000000000);
  REQUIRE(avgDeDuration < 2000000000);
}
