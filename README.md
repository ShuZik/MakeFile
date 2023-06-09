# Welcome to the ShuZik MakeFile v2.1!
## Its purpose is to simplify the installation for smooth and effortless start.
## To execute this script, kindly adhere to the following instructions:

#### 1) Open the terminal and run the installation command: make -f Makefile install
#### 2) Open the terminal and run the updating command: make -f Makefile update

Sit back, relax, and enjoy the seamless experience!

P.S. You have the flexibility to configure the install_packages section according to your specific application needs

# Let's go through it step by step:

1. **Setting up the shell and path:**
   - The `SHELL` variable is set to `/bin/bash`, indicating that the default shell used in the script is Bash.
   - The `PATH` variable is updated to include the `/usr/local/bin` directory, ensuring that executables in that directory are accessible.

2. **Defining variables:**
   - The `ruby_version` variable stores the latest Ruby version available from `rbenv install -l | grep -v - | tail -1`.
   - The `current_ruby_version` variable stores the currently installed Ruby version from `rbenv version | awk '{print $$1}'`.

3. **Rule: xcode:**
   - The target `xcode` checks if the `xcodebuild` command is available.
   - If `xcodebuild` is not found, it prompts the user to install Xcode and waits until `xcodebuild` is available.

4. **Rule: homebrew:**
   - The target `homebrew` checks if the `brew` command is available.
   - If `brew` is not found, it installs Homebrew by executing the installation script retrieved from the official Homebrew repository.

5. **Rule: rbenv:**
   - The target `rbenv` checks if the `rbenv` command is available.
   - If `rbenv` is not found, it installs rbenv using Homebrew and adds the necessary configuration to the `~/.bash_profile` file to initialize `rbenv` in the shell.

6. **Rule: ruby:**
   - The target `ruby` compares the latest Ruby version (`ruby_version`) with the current Ruby version (`current_ruby_version`).
   - If they are different, it installs the latest Ruby version using `rbenv install` and sets it as the global version using `rbenv global`.
   - After installing Ruby, it runs `rbenv rehash` to update the Ruby environment.

7. **Rule: bundler:**
   - The target `bundler` checks if the `bundler` command is available.
   - If `bundler` is not found, it installs Bundler gem using `gem install --user-install bundler` and performs `rbenv rehash` to update the Ruby environment.

8. **Rule: create_folder:**
   - The target `create_folder` checks if the `~/Developer` folder exists.
   - If the folder does not exist, it creates it using `sudo mkdir -p ~/Developer`.

9. **Rule: packages_install:**
   - The target `packages_install` installs various packages and applications using Homebrew (`brew`).
   - It installs packages like `cocoapods`, `fastlane`, `rbenv-bundler`, and applications like `iterm2`, `slack`, `figma`, `fork`, and `telegram` using the `brew install` command.

10. **Rule: package_install_rectangle:**
    - The target `package_install_rectangle` prompts the user to choose between installing `Rectangle` or `Rectangle Pro`.
    - The user's choice is stored in the `answer` variable using the `read` command.
    - Depending on the user's choice, it installs the corresponding package (`rectangle` or `rectangle-pro`) using `brew install --cask`.

11. **Rule: packages_update:**
    - The target `packages_update` upgrades the installed packages and applications to their latest versions using `brew upgrade`.
    - It upgrades packages like `cocoapods`, `fastlane`, `rbenv-bundler`, and applications like `iterm2

`, `slack`, `figma`, `fork`, and `telegram`.
    - Additionally, if either `rectangle` or `rectangle-pro` is already installed, it upgrades the corresponding package.

12. **Rule: powerlevel10k:**
    - The target `powerlevel10k` checks if the `~/.powerlevel10k` folder exists.
    - If the folder does not exist, it clones the Powerlevel10k theme repository from GitHub using `git clone`.
    - It also adds the necessary configuration to the `~/.zshrc` file to enable the Powerlevel10k theme.

13. **Rule: open_iterm2:**
    - The target `open_iterm2` opens the iTerm2 application using the `open -a iTerm` command.

14. **PHONY section:**
    - The `.PHONY` section lists all the targets that are not associated with actual files.
    - It ensures that these targets are always executed, regardless of whether a file with a matching name exists or not.

15. **Targets: install and update:**
    - The `install` target sets up the development environment by executing the necessary rules in a specific order.
    - It includes targets like `xcode`, `homebrew`, `rbenv`, `ruby`, `bundler`, `create_folder`, `packages_install`, `powerlevel10k`, and `open_iterm2`.
    - The `update` target updates the development environment by upgrading `rbenv`, `ruby`, and installed packages using the `packages_update` rule.
