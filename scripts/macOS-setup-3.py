import os

class AppUpdater:
    def __init__(self):
        self.local_bin_dir = os.path.expanduser("~/.local/bin")
        self.update_apps_path = os.path.join(self.local_bin_dir, "update-apps.sh")
        self.update_brew_path = os.path.join(self.local_bin_dir, "update-brew.sh")
        
        self.brew_commands = """
        brew update && brew upgrade
        brew install discord
        brew install fish
        brew install microsoft-edge@dev
        brew install google-chrome
        brew install firefox
        brew uninstall vscodium
        brew install gh
        brew install kitty
        brew install micro
        brew install signal
        brew install watchman
        brew install nvim
        brew install php
        brew install tabby
        brew install chatgpt
        brew uninstall firefox
        brew install opera-gx
        brew install macs-fan-control
        brew install zen-browser
        brew install code-server
        """

        self.create_directory()
        self.touch_files()
        self.remove_old_update_apps()
        self.write_brew_commands()

    def create_directory(self):
        os.makedirs(self.local_bin_dir, exist_ok=True)

    def touch_files(self):
        open(self.update_apps_path, 'a').close()
        open(self.update_brew_path, 'a').close()

    def remove_old_update_apps(self):
        if os.path.exists(self.update_apps_path):
            os.remove(self.update_apps_path)

    def write_brew_commands(self):
        with open(self.update_apps_path, 'w') as f:
            f.write(self.brew_commands)

updater = AppUpdater()

print("AppUpdater updated successfully.")
