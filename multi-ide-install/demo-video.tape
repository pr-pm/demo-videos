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

# Install for Cursor
Type "prpm install @sanjeed5/react --as cursor"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Install for Claude Code (agent)
Type "prpm install @sanjeed5/react --as claude --subtype agent"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Install for Continue
Type "prpm install @sanjeed5/react --as continue"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Install for Windsurf
Type "prpm install @sanjeed5/react --as windsurf"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Install for GitHub Copilot
Type "prpm install @sanjeed5/react --as copilot"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Install for Kiro
Type "prpm install @sanjeed5/react --as kiro"
Sleep 2s
Enter
Sleep 7s

# Final pause for viewing
Sleep 3s
