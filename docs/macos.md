# macOS Configuration Notes

### Install Docker
```bash
brew install docker
brew install colima
```

Start Docker daemon and run a test container
```bash
colima start
docker run hello-world
```

### Disable ***ANNOYING*** bouncing dock icon ([source](https://www.reddit.com/r/MacOS/comments/qsf4nh/does_anyone_else_find_the_bouncing_dock_icon/))
```bash
defaults write com.apple.dock no-bouncing -bool TRUE
killall Dock
```

### Configure Dock autohide delay & animation speed ([source](https://www.reddit.com/r/MacOS/comments/1awf1ts/show_the_dock_faster_when_moving_the_cursor_to/))
```bash
defaults write com.apple.dock autohide-time-modifier -float 0.50
defaults write com.apple.dock autohide-delay -float 0.00
killall Dock
```