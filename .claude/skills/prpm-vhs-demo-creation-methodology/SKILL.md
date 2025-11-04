---
name: vhs-demo-creation
description: Use when creating VHS terminal demo videos - ensures consistent styling, timing, and production quality across all demos
---

# VHS Demo Creation Methodology

## Purpose

Create professional, consistent terminal demonstration videos for **every prpm CLI command** using VHS (Video High-quality Screencasting). Each command and subcommand should have its own demo video showcasing functionality in a clear, engaging manner.

## Standard VHS Configuration

All demo videos MUST use these exact settings for consistency:

### For GIF Output (demo.tape)
```tape
Output demo.gif

# Terminal Setup
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"
```

### For MP4 Output (demo-video.tape)
```tape
Output demo.mp4

# Terminal Setup
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Quality Settings (prevents grainy video at start)
Set Framerate 60
Set PlaybackSpeed 1.0

# Brief pause to stabilize encoder
Sleep 200ms
```

**Why the quality settings?**
- `Set Framerate 60` - Higher framerate for smoother video
- `Set PlaybackSpeed 1.0` - Ensures consistent playback
- `Set TypingSpeed 0ms` - Instant typing (no animation delays)
- `Sleep 1s` - **CRITICAL** - Longer initial pause helps encoder stabilize (reduces graininess)
- These settings are MP4-only; GIFs don't need them

**Known Issue: Grainy Video Start**
VHS generates videos at very low bitrate (~75-85 kbps), which causes grainy/pixelated video at the start that clears up after a few seconds. This is a VHS limitation - the encoder needs time to "learn" the content.

**Workarounds:**
1. Use longer `Sleep` at start (1-2 seconds minimum)
2. Post-process with the `generate-hq-video.sh` script (see below)
3. Consider recording longer takes and trimming the first 2-3 seconds in post

**Important:** Even with post-processing, we cannot recover detail that was never captured. The best approach is to ensure VHS has time to stabilize before showing important content.

## Timing and Flow Pattern

Follow this proven pattern from the install demo for ALL videos:

1. **Command Display** (2s pause before Enter)
   - Type the command
   - Sleep 2s (gives viewers time to read)
   - Enter

2. **Clear Before Action** (when appropriate)
   - Type "clear"
   - Enter

3. **Action Processing** (vary timing based on expected output)
   - Sleep 2-7s depending on:
     - Simple commands: 2-3s
     - Commands with moderate output: 4-5s
     - Commands with extensive output: 6-7s

4. **Clear Between Demos** (show clean slate)
   - Type "clear"
   - Enter

5. **Final Output** (2-5s for viewing)
   - Show final state
   - Sleep to let viewers absorb

## Complete Command Coverage

Create individual demo videos for each command and their subcommands:

### Package Discovery Commands
- **search** - `prpm search <query> --no-interactive` (7s viewing time) - **MUST use --no-interactive flag**
- **info** - `prpm info <package-name>` (5s viewing time)
- **trending** - `prpm trending` (5-7s viewing time)
- **popular** - `prpm popular` (5-7s viewing time)
- **collections** - `prpm collections [collection-name]` (5s viewing time)

### Package Management Commands
- **install** - `prpm install <package-name>` (DONE - see install/demo.tape)
- **uninstall** - `prpm uninstall <package-name>` (4s viewing time)
- **list** - `prpm list` (4s viewing time)
- **outdated** - `prpm outdated` (5s viewing time)
- **update** - `prpm update [package-name]` (5s viewing time)
- **upgrade** - `prpm upgrade` (5s viewing time)

### Package Creation Commands
- **init** - `prpm init` (interactive, 5-7s per step)
- **publish** - `prpm publish` (5s viewing time)
- **schema** - `prpm schema` (3s viewing time)

### Authentication Commands
- **login** - `prpm login` (interactive, handle carefully)
- **whoami** - `prpm whoami` (2s viewing time)

### Utility Commands
- **index** - `prpm index [-v]` (5s viewing time)
  - Create separate demos for: basic and verbose (`-v`) flag
- **telemetry** - `prpm telemetry [enable|disable|status]` (3s viewing time each)
  - Create 3 separate demos: enable, disable, status
- **config** - Multiple subcommands, each needs its own demo:
  - `prpm config` or `prpm config list` (3s viewing time)
  - `prpm config get <key>` (2s viewing time)
  - `prpm config set <key> <value>` (3s viewing time)
  - `prpm config delete <key>` (3s viewing time)

## Demo Script Template

For each command, create TWO `.tape` files following these structures:

### GIF Version (demo.tape)
```tape
# VHS documentation: https://github.com/charmbracelet/vhs

Output demo.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Show the command
Type "prpm <command> [args]"
Sleep 2s
Enter

# Wait for output
Sleep <appropriate-timing>s

# Clear if showing multiple steps
Type "clear"
Enter

# [Additional steps as needed]

# Final pause for viewing
Sleep 2s
```

### MP4 Version (demo-video.tape)
```tape
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

# Show the command
Type "prpm <command> [args]"
Sleep 2s
Enter

# Wait for output
Sleep <appropriate-timing>s

# Clear if showing multiple steps
Type "clear"
Enter

# [Additional steps as needed]

# Final pause for viewing
Sleep 2s
```

## File Organization

Organize demo files in the following structure:

```
demos/
├── install/
│   ├── demo.tape         # Generates GIF
│   ├── demo.gif          # For web/documentation
│   ├── demo-video.tape   # Generates MP4
│   └── demo.mp4          # For YouTube/video platforms
├── search/
│   ├── demo.tape
│   ├── demo.gif
│   ├── demo-video.tape
│   └── demo.mp4
├── info/
│   ├── demo.tape
│   ├── demo.gif
│   ├── demo-video.tape
│   └── demo.mp4
└── [command-name]/
    ├── demo.tape         # For GIF generation
    ├── demo.gif
    ├── demo-video.tape   # For MP4 generation
    └── demo.mp4
```

**Note:** Create both GIF and MP4 versions:
- **GIF** (`demo.tape` → `demo.gif`) - For embedding in documentation, README files, and web pages
- **MP4** (`demo-video.tape` → `demo.mp4`) - For YouTube, video tutorials, and social media

## Quality Guidelines

1. **Realistic Scenarios**: Use real package names and realistic examples
2. **Clean Terminal**: Always start with a clear terminal (`clear` command)
3. **Readable Pace**: Never rush - 2s minimum between commands
4. **Show Results**: Let output display long enough to read key information
5. **Error-Free**: Ensure commands work before recording
6. **Context**: Show command help or --help output when useful

## Special Considerations

### Interactive Commands (login, init, search)
- Increase sleep times between prompts (3-4s)
- Show realistic user input
- Mask sensitive information (use placeholder tokens)
- **IMPORTANT for search command**: Always use `--no-interactive` flag to prevent pagination prompts
  ```tape
  Type "prpm search pulumi --no-interactive"
  ```
  Without this flag, the search command will enter interactive mode and wait for user input, causing the VHS recording to hang.

### Commands with Long Output
- Consider showing partial output with scrolling
- Use appropriate sleep times (6-7s)
- May need Height adjustment for better viewing

### Commands with Flags/Options
- Create separate demos for important flag variations
- Example: `prpm index` vs `prpm index -v`
- **Always use `--no-interactive` for search commands** in VHS demos

## Example: Multi-Step Demo

```tape
# Show listing current packages
Type "prpm list"
Sleep 2s
Enter
Sleep 4s

Type "clear"
Enter

# Show installing a new package
Type "prpm install @prpm/example-skill"
Sleep 2s
Enter
Sleep 5s

Type "clear"
Enter

# Show updated list
Type "prpm list"
Sleep 2s
Enter
Sleep 4s
```

## Generating Demo Videos

After creating your `.tape` files, generate both GIF and MP4 versions:

### Generate GIF (for web/documentation)
```bash
cd demos/<command-name>/
vhs demo.tape
```

This will create `demo.gif` in the same directory.

### Generate MP4 (for YouTube/video platforms)

**Option 1: Quick Generation (lower quality)**
```bash
cd demos/<command-name>/
vhs demo-video.tape
```

This will create `demo.mp4` but with VHS's default low bitrate (~75-85 kbps).

**Option 2: High-Quality Generation (recommended for YouTube)**
```bash
cd demos/
./generate-hq-video.sh <command-name>/demo-video.tape
```

This script:
1. Generates the video with VHS
2. Re-encodes with high-quality settings (2500 kbps bitrate, CRF 15)
3. Creates `demo-youtube.mp4` ready for YouTube upload

**The generate-hq-video.sh script:**
```bash
#!/bin/bash
# Located at demos/generate-hq-video.sh

set -e

if [ -z "$1" ]; then
    echo "Usage: ./generate-hq-video.sh <demo-video.tape>"
    echo "Example: ./generate-hq-video.sh install/demo-video.tape"
    exit 1
fi

TAPE_FILE="$1"
DIR=$(dirname "$TAPE_FILE")
OUTPUT_FILE="$DIR/demo.mp4"
HQ_FILE="$DIR/demo-youtube.mp4"

echo "🎬 Generating video with VHS..."
cd "$DIR" && vhs "$(basename "$TAPE_FILE")" && cd - > /dev/null

echo "🎨 Re-encoding for YouTube quality..."
ffmpeg -i "$OUTPUT_FILE" \
    -c:v libx264 \
    -crf 15 \
    -preset veryslow \
    -tune film \
    -profile:v high \
    -level 4.2 \
    -pix_fmt yuv420p \
    -movflags +faststart \
    -b:v 2500k \
    -maxrate 5000k \
    -bufsize 10000k \
    -y \
    "$HQ_FILE"

echo "✅ High-quality video created: $HQ_FILE"
```

**Complete workflow example:**
```bash
# Generate high-quality video for YouTube
cd demos/
./generate-hq-video.sh search/demo-video.tape

# This creates:
# - search/demo.mp4 (VHS output, ~85 kbps)
# - search/demo-youtube.mp4 (re-encoded, ~2500 kbps) ← Upload this to YouTube

# Also generate GIF for documentation
cd search/
vhs demo.tape
```

**Output Comparison:**
- **GIF**: Typically 500KB - 2.5MB, loops automatically, widely supported in documentation
- **MP4 (VHS)**: Typically 200-300KB, low bitrate (~85 kbps), grainy start
- **MP4 (YouTube)**: Typically 250-500KB, high bitrate (2500 kbps), much better quality

**Note:** Always use the `-youtube.mp4` version for YouTube uploads!

## Testing Your Demo

Before finalizing:
1. **Generate the GIF**: Run `vhs demo.tape` from within the command's demo directory
2. **View the output**: Open the generated `demo.gif` file
3. **Review quality**:
   - Text is readable at all stages
   - Timing feels natural (not too fast or slow)
   - Output is complete and makes sense
   - Follows the standard format above
4. **Iterate if needed**: Edit the `.tape` file and regenerate until perfect

## Complete Workflow for Creating a Demo

1. **Create the directory structure**
   ```bash
   mkdir -p demos/<command-name>/
   ```

2. **Write the `.tape` files**
   ```bash
   # Create demos/<command-name>/demo.tape with:
   # Output demo.gif
   # - Standard VHS configuration
   # - Command demonstrations
   # - Appropriate timing

   # Create demos/<command-name>/demo-video.tape with:
   # Output demo.mp4  (only difference is the output format)
   # - Same content as demo.tape
   # - Standard VHS configuration
   # - Command demonstrations
   # - Appropriate timing
   ```

3. **Generate both formats**
   ```bash
   cd demos/<command-name>/

   # Generate GIF for web
   vhs demo.tape

   # Generate MP4 for YouTube
   vhs demo-video.tape
   ```

4. **Review and iterate**
   ```bash
   # View the generated files
   open demo.gif  # macOS
   open demo.mp4  # macOS
   xdg-open demo.gif  # Linux
   xdg-open demo.mp4  # Linux

   # If changes needed, edit both .tape files and regenerate
   vhs demo.tape
   vhs demo-video.tape
   ```

5. **Verify quality** (see Testing Your Demo section above)

## YouTube Video Metadata

When creating MP4 videos for YouTube, also generate optimized metadata for SEO and discoverability.

### Title Format
```
<Action> with PRPM - <Benefit> | <Context>
```

**Examples:**
- "Search Packages with PRPM - Filter by Type & Author | Quick Tutorial"
- "Install Claude Code Skills with PRPM - 2 Minute Setup Guide"
- "List Installed Packages with PRPM | Package Management Tutorial"

**Rules:**
- Keep under 60 characters for full display in search
- Include "PRPM" for branding
- Front-load main keywords
- Be specific about what viewers learn

### Description Template

```
Learn how to use PRPM (Prompt Package Manager) to <main action>.

In this tutorial, you'll learn:
✅ <Key learning point 1>
✅ <Key learning point 2>
✅ <Key learning point 3>
✅ <Key learning point 4>

🔗 Quick Links:
- PRPM Website: https://prpm.dev
- Install PRPM: npm install -g prpm
- Documentation: https://prpm.dev/docs
- GitHub: https://github.com/<your-repo>

⏱️ Timestamps:
<Generate based on video content>
0:00 - <First action>
0:XX - <Second action>
0:XX - <Third action>

<Natural paragraph integrating keywords>
This tutorial covers PRPM package manager, Claude Code skills,
AI coding assistant tools, and developer productivity. Perfect for
developers using Claude AI, Anthropic Claude, or looking for
package management solutions.

#PRPM #ClaudeCode #ClaudeAI #DeveloperTools

📺 More PRPM Tutorials:
- Install: <link>
- Search: <link>
- Update: <link>

Subscribe for more Claude Code and AI developer tool tutorials!
```

### Tags (500 character limit)

**Base tags for all PRPM videos (under 500 characters):**
```
prpm,claude code,claude ai,anthropic claude,ai coding assistant,package manager,developer tools,coding tutorial,claude skills,claude agents,prompt engineering,ai tools,cursor alternative,vscode ai,prpm tutorial,claude code setup,ai development,developer productivity,npm package,command line tools,terminal tutorial,ai programming,code automation,software development,programming tutorial,tech tutorial,developer workflow,ai integration
```
*Character count: 473/500*

**Note:** No spaces after commas to maximize character usage.

**Add command-specific tags:**
- For **search**: package search, npm search, find packages, package discovery, search npm packages
- For **install**: package install, npm install, install packages, package setup, dependency management
- For **list**: list packages, show installed, package list, installed packages, dependency list
- For **uninstall**: remove packages, uninstall npm, package removal, clean packages, remove dependencies
- For **info**: package info, package details, package metadata, view package, npm info
- For **trending**: trending packages, popular packages, top packages, package rankings, best packages
- For **update**: update packages, upgrade packages, package updates, dependency updates, version management

### Timestamps Generation

For each command demo, create timestamps based on actual video sections:

**Example for install video:**
```
⏱️ Timestamps:
0:00 - Navigate to project directory
0:05 - Install PRPM globally with npm
0:15 - Search for Pulumi packages
0:25 - View package details and info
0:35 - Install the skill package
0:45 - Verify installation with list
0:52 - View installed skill file
```

**Rules for timestamps:**
- Must start with `0:00`
- Use format `M:SS` or `MM:SS`
- Include dash separator: `0:00 - Description`
- At least 3 timestamps required for YouTube chapters
- Be specific and action-oriented
- Use keywords naturally in descriptions

### Hashtags

Add 3-5 hashtags at the end of description (clickable tags):

**Format:**
```
#PRPM #ClaudeCode #ClaudeAI
```

**Command-specific hashtags:**
- **search**: #PackageSearch #NPMSearch #DeveloperTools
- **install**: #PackageInstall #NPMInstall #DevSetup
- **list**: #PackageManagement #InstalledPackages #NPM
- **info**: #PackageInfo #NPMInfo #PackageDetails
- **trending**: #TrendingPackages #PopularPackages #DevTools
- **config**: #Configuration #Settings #DevConfig

### Thumbnail Recommendations

For consistent branding across all PRPM videos:

**Design elements:**
- Command name in large text (e.g., "SEARCH", "INSTALL")
- PRPM logo or terminal icon
- Catppuccin Mocha color scheme to match videos
- Resolution: 1280x720px (16:9 ratio)
- File size: Under 2MB
- Text readable at small sizes

**Text ideas:**
- "prpm search" + "Find packages fast"
- "prpm install" + "Set up in seconds"
- "prpm list" + "View all packages"

## Checklist for Each Command

- [ ] Created directory for command
- [ ] Written `demo.tape` file (GIF output) with standard settings
- [ ] Written `demo-video.tape` file (MP4 output) with quality settings
- [ ] Used appropriate sleep timings (minimum 1s initial pause for MP4)
- [ ] Included clear commands between steps
- [ ] Generated the GIF with `vhs demo.tape`
- [ ] Generated high-quality MP4 with `./generate-hq-video.sh <command>/demo-video.tape`
- [ ] Verified GIF output is readable and professional
- [ ] Verified `demo-youtube.mp4` has good quality (no excessive graininess)
- [ ] Follows the install demo pattern
- [ ] Video demonstrates all key command options/subcommands
- [ ] Both GIF and MP4 use identical content (only Output line differs)
- [ ] Created optimized YouTube title (under 60 chars)
- [ ] Generated complete description with timestamps
- [ ] Added all relevant tags (up to 500 characters)
- [ ] Prepared 3-5 hashtags for description
- [ ] Noted command-specific keywords for this video
- [ ] Uploaded `demo-youtube.mp4` to YouTube (NOT demo.mp4)

