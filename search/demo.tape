# VHS documentation: https://github.com/charmbracelet/vhs

Output demo.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Basic search by query
Type "prpm search pulumi --no-interactive"
Sleep 2s
Enter

# Wait for search results
Sleep 7s

Type "clear"
Enter

# Search with subtype filter
Type "prpm search --subtype skill --no-interactive"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Search with format filter
Type "prpm search debugging --format claude --no-interactive"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Search by author
Type "prpm search --author obra --no-interactive"
Sleep 2s
Enter
Sleep 7s
