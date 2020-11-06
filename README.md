# cmake-stm32l4-example

Cmake based example project for the [B-L475E-IOT01A](https://www.st.com/resource/en/data_brief/b-l475e-iot01a.pdf) discovery kit with unit tests.

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


## Useful Documents

- [Product Brief B-L475E-IOT01A](https://www.st.com/resource/en/data_brief/b-l475e-iot01a.pdf)
- [User Manual B-L475E-IOT01A](https://www.st.com/resource/en/user_manual/dm00347848-discovery-kit-for-iot-node-multichannel-communication-with-stm32l4-stmicroelectronics.pdf)
- [Reference Manual STM32L475VGT](https://www.st.com/resource/en/reference_manual/dm00083560-stm32l4x5-and-stm32l4x6-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf)

## TODO

- On target debugging
- Flash with VS Code
- Use conan packages for googletest