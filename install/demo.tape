# VHS documentation: https://github.com/charmbracelet/vhs

Output demo.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Show the prpm install command
Type "npm install -g prpm"
Sleep 2s
Enter

Type "clear"
Enter

# Wait for installation
Sleep 2s

# Show the installed files
Type "prpm search pulumi"
Enter
Sleep 7s

Type "clear"
Enter

# Show the cursor rules file
Type "prpm info @prpm/pulumi-troubleshooting-skill"
Enter
Sleep 5s

Type "clear"
Enter

# Install
Type "prpm install @prpm/pulumi-troubleshooting-skill"
Enter
Sleep 4s

# Show prpm list
Type "prpm list"
Enter
Sleep 4s

Type "clear"
Enter

# Show prpm list
Type "cat .claude/skills/pulumi-troubleshooting-skill.md"
Enter
Sleep 2s
