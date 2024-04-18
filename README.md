# Weather-IOS

https://github.com/Ilusha2004/Weather-IOS/assets/102541387/8151682f-c9b0-4f06-bf5b-35efd0cb414a

## Development tools

### Apllication suppports following

- Single Page Pattern

- Caching data (**SharedPreferences**)

- Support API service (**OpenWeatherAPI**)

- Monitoring forecast in real time by your location (with using **geolocator**)

- Minimalistic design

- Searching by city (**IN PROGRESS**)

- Adaptive design (**IN PROGRESS**)

- Dynamic switching background depending on weather (**IN PROGRESS**)

# How to run a project (for **VS Code** on **MacOS**)

Some Flutter components require the [Rosetta 2 translation process](https://github.com/flutter/website/pull/7119#issuecomment-1124537969) on Macs running Apple silicon. To run all Flutter components on [Apple silicon](https://support.apple.com/en-us/HT211814), install [Rosetta 2](https://support.apple.com/en-us/HT211861)

``` s
 $ sudo softwareupdate --install-rosetta --agree-to-license
```

### Download and install the following packages.

- [Xcode 15](https://developer.apple.com/xcode/) to debug and compile native Swift or ObjectiveC code. The Xcode installation includes Git 2.27 or later to manage source code.

- [CocoaPods](https://cocoapods.org/) 1.13 to compile enable Flutter plugins in your native apps.

When you run the current version of <span style="color:green">**flutter doctor**</span>, it might list a different version of one of these packages. If it does, install the version it recommends.

### Text editor or integrated development environment

- [Visual Studio Code](https://code.visualstudio.com/docs/setup/mac) 1.77 or later with the [Flutter extension for VS Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).

# Install the Flutter SDK

To install the Flutter SDK, you can use the VS Code Flutter extension or download and install the Flutter bundle yourself.

## Use VS Code to install Flutter

To install Flutter using these instructions, verify that you have installed [Visual Studio Code](https://code.visualstudio.com/docs/setup/mac) 1.77 or later and the [Flutter extension for VS Code](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter).

### Prompt VS Code to install Flutter

1. Launch VS Code.

2. To open the **Command Palette**, press Command + Shift + P.

3. In the **Command Palette**, type flutter.

4. Select **Flutter: New Project**.

5. VS Code prompts you to locate the Flutter SDK on your computer.

     1. If you have the Flutter SDK installed, click **Locate SDK**.

     2. If you do not have the Flutter SDK installed, click **Download SDK**.

          This option sends you the Flutter install page if you have not installed Git as directed in the [development tools prerequisites](https://docs.flutter.dev/get-started/install/macos/mobile-ios?tab=vscode#development-tools).

6. When prompted **Which Flutter template?**, ignore it. Press Esc. You can create a test project after checking your development setup.


### Download the Flutter SDK

1. When the Select Folder for Flutter SDK dialog displays, choose where you want to install Flutter.

     VS Code places you in your user profile to start. Choose a different location.

     Consider <span style="color:green">**~/development/**</span>

2. Click Clone Flutter.

     While downloading Flutter, VS Code displays this pop-up notification:

     ```
     Downloading the Flutter SDK. This may take a few minutes.
     ```

     This download takes a few minutes. If you suspect that the download has hung, click **Cancel** then start the           installation again.

3. Once it finishes downloading Flutter, the Output panel displays.

     ```
     Checking Dart SDK version...
     Downloading Dart SDK from the Flutter engine ...
     Expanding downloaded archive...
     ```

     When successful, VS Code displays this pop-up notification:

     ```
     Initializing the Flutter SDK. This may take a few minutes.
     ```

     While initializing, the Output panel displays the following:

     ```
     Building flutter tool...
     Running pub upgrade...
     Resolving dependencies...
     Got dependencies.
     Downloading Material fonts...
     Downloading Gradle Wrapper...
     Downloading package sky_engine...
     Downloading flutter_patched_sdk tools...
     Downloading flutter_patched_sdk_product tools...
     Downloading windows-x64 tools...
     Downloading windows-x64/font-subset tools...
     ```

     This process also runs flutter doctor -v. At this point in the procedure, ignore this output. Flutter Doctor might show errors that don't apply to this quick start.

     When the Flutter install succeeds, VS Code displays this pop-up notification:

     ```
     Do you want to add the Flutter SDK to PATH so it's accessible
     in external terminals?
     ```

     4. VS Code may display a Google Analytics notice.

          If you agree, click **OK**.

     5. To enable <span style="color:green">*flutter*</span> in all Terminal windows:

          Close, then reopen all Terminal windows.
          Restart VS Code.

## Download then install Flutter

To install Flutter, download the Flutter SDK bundle from its archive, move the bundle to where you want it stored, then extract the SDK.

1. Download the following installation bundle to get the latest stable release of the Flutter SDK.

     [Intel Processor](https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.19.6-stable.zip), [Apple Silicon](https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.19.6-stable.zip)

     For other release channels, and older builds, check out the SDK archive.

     The Flutter SDK should download to the macOS default download directory: ~/Downloads/.

2. Create a folder where you can install Flutter.

     Consider creating a directory at ~/development/.

3. Extract the zip file into the directory you want to store the Flutter SDK.

     ``` s
     $ unzip ~/Downloads/flutter_macos_3.19.6-stable.zip ~/development/
     ```

     When finished, the Flutter SDK should be in the <span style="color:green">**~/development/flutter**</span> directory.

### Add Flutter to your PATH

To run Flutter commands in the Terminal, add Flutter to the PATH environment variable. This guide presumes your [Mac runs the latest default shell](https://support.apple.com/en-us/102360), <span style="color:green">zsh</span>. Zsh uses the <span style="color:green">.zshenv</span> file for [environment variables](https://zsh.sourceforge.io/Intro/intro_3.html).

1. Launch your preferred text editor.

2. If it exists, open the Zsh environmental variable file <span style="color:green">**~/.zshenv**</span> in your text editor. If it doesn't, create <span style="color:green">**~/.zshenv**</span>.

3. Copy the following line and paste it at the end of your <span style="color:green">**~/.zshenv**</span> file.

     ``` bash
     export PATH=$HOME/development/flutter/bin:$PATH
     ```

4. Save your ~/.zshenv file.

5. To apply this change, restart all open terminal sessions.

If you use another shell, check out [this tutorial on setting your PATH](https://www.cyberciti.biz/faq/unix-linux-adding-path/).

## Configure iOS development

### Configure Xcode

To develop Flutter apps for iOS, install Xcode to compile to native bytecode.

1. To configure the command-line tools to use the installed version of Xcode, run the following commands.

     ```
     $ sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
     ```

     To use the latest version of Xcode, use this path. If you need to use a different version, specify that path instead.


2. Sign the Xcode license agreement.

     ```
     $ sudo xcodebuild -license
     ```

Try to keep to the current version of Xcode.

## Configure your target iOS device (Virtual Device)

### Configure your iOS simulator

To prepare to run and test your Flutter app on the iOS simulator, follow this procedure.

1. To install the iOS Simulator, run the following command.

     ```
     $ xcodebuild -downloadPlatform iOS
     ```

2. To start the Simulator, run the following command:

     ```
     $ open -a Simulator
     ```

3. Set your Simulator to use a 64-bit device. This covers the iPhone 5s or later.

     - From Xcode, choose a simulator device type.

          1. Go to Window > Devices and Simulators.

               You can also press Cmd + Shift + 2.

          2. Once the Devices and Simulators dialog opens, click Simulators.

          3. Choose a Simulator from the left-hand list or press + to create a new simulator.

     - From the Simulator app, go to File > Open Simulator > Choose your target iOS device.

     - To check the device version in the Simulator, open the Settings app > General > About.

## Install CocoaPods

If your apps depend on Flutter plugins with native iOS code, install CocoaPods. This program bundles various dependencies across Flutter and iOS code.

To install and set up CocoaPods, run the following commands:

1. Install cocoapods following the CocoaPods install guide.

     ``` s
     $ sudo gem install cocoapods
     ```

2. Launch your preferred text editor.

3. Open the Zsh environmental variable file ~/.zshenv in your text editor.

4. Copy the following line and paste it at the end of your ~/.zshenv file.

     ``` bash
     export PATH=$HOME/.gem/bin:$PATH
     ```

5. Save your ~/.zshenv file.

6. To apply this change, restart all open terminal sessions.

## Check your development setup

### Run Flutter doctor

The flutter doctor command validates that all components of a complete Flutter development environment for .

1. Open a shell.

2. To verify your installation of all the components, run the following command.

     ``` s
     $ flutter doctor
     ```
As you chose to develop for iOS, you do not need all components. If you followed this guide, the result of your command should resemble:

``` s
Running flutter doctor...
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.19.3, on , locale en)
[!] Android toolchain - develop for Android devices
[!] Chrome - develop for the web
[✓] Xcode - develop for iOS and macOS (Xcode 15)
[!] Android Studio (not installed)
[✓] VS Code (version 1.86)
[✓] Connected device (1 available)
[✓] Network resources


! Doctor found issues in 3 categories.
```

### Troubleshoot Flutter doctor issues

When the flutter doctor command returns an error, it could be for Flutter, VS Code, , the connected device, or network resources.

If the flutter doctor command returns an error for any of these components, run it again with the verbose flag.

``` s
$ flutter doctor -v
```

Check the output for other software you might need to install or further tasks to perform.

If you change the configuration of your Flutter SDK or its related components, run flutter doctor again to verify the installation.

<!-- ### Step 1:
Сделать клон приложения погоды, пользуясь сервисом openweathermap.
Приложение должно уметь брать ваше текущее местоположение и показать текущую погоду. Так же должна присутствовать иконка текущей погоды
### Step 2:
Снизу сделать карусель, такую же как в нативном приложении которое показывает погоду для каждого часа (реализовать для следующих +6 часов), а так же отображать в карусели иконку погоды
### Step 3:
Добавить поиск, который при вводе названия города (либо предлагаемый список городов), будет переводить на новый экран и показывать текущую погоду в этом городе (градусы и иконка)
### Step 4:
Добавить под горизонтально каруселью которая показывает погоду для каждого часа, вертикальный список с погодой на неделю вперед
### Step 5:
Сделать кэширование погоды, если пользователь зашел без интернета
### Step 6:
проверять соединение пользователя при запуске, если интернет есть, делать запрос, если нет, то показывать ранее загруженные данные
### Step 7:
Если интернета нет, то загружать предыдущую текущую погоду и говорить пользователю насколько это устарелые данные Пример: (10c (10ч назад)) Сделать интервалы: 1min > 59 min 1h > 23h >1d
### Step 8:
Сделать 2 локализации этого приложения, если приложения на англ - показывать Фаренгейты, если на русском языке, то Цельсии -->


# Weather-IOS BY_KOVLYA
