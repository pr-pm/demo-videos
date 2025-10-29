---
name: vhs-demo-creation
description: Use when creating VHS terminal demo videos - ensures consistent styling, timing, and production quality across all demos
---

# VHS Demo Creation Methodology

## Purpose

Create professional, consistent terminal demonstration videos for **every prpm CLI command** using VHS (Video High-quality Screencasting). Each command and subcommand should have its own demo video showcasing functionality in a clear, engaging manner.

## Standard VHS Configuration

All demo videos MUST use these exact settings for consistency:

```tape
Output demo.gif

# Terminal Setup
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"
```

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

For each command, create a `.tape` file following this structure:

```tape
# VHS documentation: https://github.com/charmbracelet/vhs

Output <command-name>-demo.gif

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

## File Organization

Organize demo files in the following structure:

```
demos/
├── install/
│   └── demo.tape
├── search/
│   └── demo.tape
├── info/
│   └── demo.tape
├── config/
│   ├── list-demo.tape
│   ├── get-demo.tape
│   ├── set-demo.tape
│   └── delete-demo.tape
└── [command-name]/
    └── demo.tape
```

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

## Generating the Demo Video

After creating your `.tape` file, generate the video:

```bash
cd demos/<command-name>/
vhs demo.tape
```

This will create `demo.gif` in the same directory.

**Example workflow:**
```bash
# Navigate to the demo directory
cd demos/search/

# Generate the GIF from the tape file
vhs demo.tape

# View the generated GIF (macOS)
open demo.gif

# Or view it in your terminal (if using a compatible terminal)
vhs demo.tape --publish
```

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

2. **Write the `.tape` file**
   ```bash
   # Create demos/<command-name>/demo.tape with:
   # - Standard VHS configuration
   # - Command demonstrations
   # - Appropriate timing
   ```

3. **Generate the video**
   ```bash
   cd demos/<command-name>/
   vhs demo.tape
   ```

4. **Review and iterate**
   ```bash
   # View the generated demo.gif
   open demo.gif  # macOS
   xdg-open demo.gif  # Linux

   # If changes needed, edit demo.tape and regenerate
   vhs demo.tape
   ```

5. **Verify quality** (see Testing Your Demo section above)

## Checklist for Each Command

- [ ] Created directory for command
- [ ] Written `.tape` file with standard settings
- [ ] Used appropriate sleep timings
- [ ] Included clear commands between steps
- [ ] Generated the demo with `vhs demo.tape`
- [ ] Verified GIF output is readable and professional
- [ ] Follows the install demo pattern
- [ ] Video demonstrates all key command options/subcommands

