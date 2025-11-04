# VHS documentation: https://github.com/charmbracelet/vhs

Output demo.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Show current packages
Type "prpm list"
Sleep 2s
Enter
Sleep 4s

Type "clear"
Enter

# Uninstall a package
Type "prpm uninstall @prpm/pulumi-troubleshooting-skill"
Sleep 2s
Enter

# Wait for uninstall
Sleep 4s

Type "clear"
Enter

# Show updated list
Type "prpm list"
Sleep 2s
Enter
Sleep 4s
