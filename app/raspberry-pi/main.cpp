/**
  ******************************************************************************
  * @file           : main.cpp
  * @brief          : Main program body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <iostream>
#include <thread>
#include <chrono>

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  uint32_t count = 0;

  /* Infinite loop */
  for (;;)
  {
    std::cout << "Alive-Count: " << count << "\r";
    std::cout.flush();
    count++;
    std::this_thread::sleep_for(std::chrono::seconds(1));
  }
}