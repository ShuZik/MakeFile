# This Makefile consists of several rules and targets to automate the installation for iOS Developing. 
# Let's go through it step by step:

1. Setting up the shell and path:
   - `SHELL := /bin/bash` sets the default shell to Bash.
   - `PATH := /usr/local/bin:$(PATH)` adds the `/usr/local/bin` directory to the system's PATH variable.

2. Defining variables:
   - `ruby_version` stores the latest Ruby version available from rbenv.
   - `current_ruby_version` stores the currently active Ruby version from rbenv.

3. Rule: `xcode`:
   - Checks if the `xcodebuild` command is available.
   - If not, prompts the user to install Xcode and accepts the license agreement.

4. Rule: `homebrew`:
   - Checks if the `brew` command is available.
   - If not, installs Homebrew using the official installation script.

5. Rule: `rbenv`:
   - Checks if the `rbenv` command is available.
   - If not, installs rbenv using Homebrew and adds the necessary configuration to the `~/.bash_profile` file.

6. Rule: `ruby`:
   - Compares the latest Ruby version with the current Ruby version.
   - If they are different, installs the latest Ruby version using rbenv and sets it as the global version.

7. Rule: `bundler`:
   - Checks if the `bundler` command is available.
   - If not, installs Bundler gem and performs `rbenv rehash` to update the Ruby environment.

8. Rule: `create_folder`:
   - Checks if the `~/Developer` folder exists.
   - If not, creates the `~/Developer` directory.

9. Rule: `packages`:
   - Upgrades or installs various packages using Homebrew, including Cocoapods, Fastlane, rbenv-bundler, Fork, iTerm2, Zsh, Slack, Figma, Telegram, and either Rectangle or Rectangle Pro depending on availability.

10. Rule: `powerlevel10k`:
    - Checks if the `~/.powerlevel10k` folder exists.
    - If not, clones the Powerlevel10k theme repository and adds the necessary configuration to the `~/.zshrc` file.

11. Rule: `open`:
    - Opens iTerm2.
    - If `rectangle` command is available, opens the Rectangle app.
    - If `rectangle-pro` command is available, opens the Rectangle Pro app.

12. `.PHONY` section:
    - Lists all the targets that are not associated with actual files.
    - Ensures that these targets are always executed, regardless of file modifications.

13. Targets: `install` and `update`:
    - `install` target runs the necessary rules for installation, including xcode, homebrew, rbenv, ruby, bundler, create_folder, packages, powerlevel10k, and open_iterm2.
    - `update` target updates rbenv, ruby, and packages.
