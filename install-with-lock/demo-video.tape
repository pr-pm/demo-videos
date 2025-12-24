# VHS documentation: https://github.com/charmbracelet/vhs

Output demo.mp4

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Quality Settings
Set Framerate 60
Set PlaybackSpeed 1.0

# Brief pause to stabilize encoder
Sleep 200ms

# Show the prpm install command for a collection
Type "prpm install nango-function-builder"
Sleep 2s
Enter

# Wait for collection installation (4 packages)
Sleep 8s

Type "clear"
Enter

# Show the lock file to demonstrate dependency resolution
Type "cat prpm.lock"
Sleep 2s
Enter

# Wait for output viewing
Sleep 5s
