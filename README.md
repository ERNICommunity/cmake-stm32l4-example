# cmake-stm32l4-example

Cmake based example project for the [B-L475E-IOT01A](https://www.st.com/resource/en/data_brief/b-l475e-iot01a.pdf) discovery kit with unit tests.

## Status
![example workflow name](https://github.com/ERNICommunity/cmake-stm32l4-example/workflows/build-app_arm-gcc/badge.svg)
![example workflow name](https://github.com/ERNICommunity/cmake-stm32l4-example/workflows/buildNtest-core_linux-gcc/badge.svg)

## Getting Started

### Prerequisites

- [git](https://git-scm.com/downloads)
- [Docker Desktop](https://www.docker.com/get-started)
- [Visual Studio Code](https://code.visualstudio.com/)
  - Add Extension `ms-vscode-remote.remote-containers`

### Installation

- Get the repo:
  ```ssh
  git clone --recursive https://github.com/ERNICommunity/cmake-stm32l4-example
  ```
- Start `Docker Desktop`
- Open the project folder in VS Code.  
  Press `ctrl+shift+p` to open the command palette and enter `Remote-Containers: Reopen in Container`.

### Build

- Open the internal terminal in VS Code
  Press `ctrl+shift+p` to open the command palette and enter `Toggle Integrated Terminal`.
- Build the app or the tests with the scripts in the tools folder:
  ```ssh
  ./tools/build_app.sh
  ```

### Flash the image

- Use the Micro USB cable to connect the **USB STLink** port on the STM DevKit to your computer.
- In File Explorer, find the binary files that you created in the previous section.
- Copy the binary file.
- In File Explorer, find the STM Devkit that's connected to your computer. The device appears as a drive on your system with the drive label **DIS_L4IOT**.
- Paste the binary file into the root folder of the STM Devkit. Flashing starts automatically and completes in a few seconds.

    > Note: During the flashing process, a LED rapidly toggles between red and green on the STM DevKit.

### Debugging

- Get [openODC](http://openocd.org/getting-openocd/)
- Start OpenODC (Replace MY_IP_ADDRESS with your actual IP): 
  ```
  cd path_to_openocd_folder
  openocd -f scripts/interface/stlink.cfg -f scripts/board/stm32l4discovery.cfg -c "gdb_port 3333" -c "telnet_port 4444" -c "bindto MY_IP_ADDRESS" -c "init; reset init; halt"
  ```
- Open `.vscode/launch.json` file
- Change go to the 'cortex-debug' configuration an change the IP-address under `"gdbTarget": "MY_IP_ADDRESS:3333"` to your IP-address

At moment an autoconfiguration of the IP-address isn't possible.

## Useful Documents

- [Product Brief B-L475E-IOT01A](https://www.st.com/resource/en/data_brief/b-l475e-iot01a.pdf)
- [User Manual B-L475E-IOT01A](https://www.st.com/resource/en/user_manual/dm00347848-discovery-kit-for-iot-node-multichannel-communication-with-stm32l4-stmicroelectronics.pdf)
- [Reference Manual STM32L475VGT](https://www.st.com/resource/en/reference_manual/dm00083560-stm32l4x5-and-stm32l4x6-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf)

## TODO

- Flash with VS Code
- Use conan packages for googletest
- Autoconfig for IP-address in debug settings
- Integrate unit test building in vs code cmake extension (at moment only possible via script)