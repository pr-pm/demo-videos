---
name: vhs-video-creator
description: Use when creating VHS terminal demo videos - ensures consistent styling, timing, and production quality across all demos
---

# VHS Video Creator Skill

Use this skill when creating or updating VHS terminal demo videos to ensure consistency and quality.

## When to Use This Skill

- Creating a new demo video for a feature or workflow
- Updating an existing VHS tape file
- Reviewing a VHS demo for quality and consistency
- Planning the flow of a terminal demonstration

## PRPM VHS Best Practices

### 1. Standard Configuration

Every VHS tape file MUST start with these settings:

```tape
# VHS documentation: https://github.com/charmbracelet/vhs

Output <demo-name>.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"
```

**Why these settings:**
- FontSize 16: Readable but not too large for screen recordings
- Width 1200: Wide enough for typical command output without wrapping
- Height 900: Tall enough to show substantial output
- Catppuccin Mocha: Consistent brand theme with good contrast

### 2. Timing Guidelines

Use strategic sleep timing for optimal viewing:

- **After Type commands**: `Sleep 500ms` - Brief pause before Enter
- **After quick commands**: `Sleep 2s` - Show the command typed
- **After Enter for commands**: `Sleep 2-4s` - Let viewers read output
- **After clear screen**: `Sleep 500ms` - Quick transition
- **For long output**: `Sleep 5-7s` - Give time to scan results

**Examples:**
```tape
Type "prpm search pulumi"
Enter
Sleep 7s  # Long output with search results

Type "prpm info @prpm/package-name"
Enter
Sleep 5s  # Medium output with package details

Type "prpm list"
Enter
Sleep 4s  # Short output with list
```

### 3. Demo Flow Structure

Follow this pattern for clean, professional demos:

```tape
# 1. Show the command
Type "command here"
Sleep 2s
Enter

# 2. Wait for output to display
Sleep <appropriate-time>

# 3. Clear screen between major sections
Type "clear"
Enter

# 4. Move to next command
```

**Clear screen when:**
- Transitioning between different workflow steps
- Output would create too much scrollback
- Starting a new logical section of the demo

**DON'T clear screen when:**
- Showing sequential related commands
- Building up context that should be visible
- Output is brief and relevant to next step

### 4. Command Typing Style

**DO:**
- Type full commands as users would enter them
- Include flags and options that demonstrate best practices
- Show realistic paths (like `.claude/skills/` for installed files)

**DON'T:**
- Use shortened commands that hide what's happening
- Skip important setup steps
- Type unrealistically fast (no Sleep before Enter)

### 5. Demo Planning Checklist

Before creating a VHS tape, plan the demo:

- [ ] What is the main workflow being demonstrated?
- [ ] What commands are essential vs. nice-to-have?
- [ ] What output do viewers need to see?
- [ ] Where should screen clears happen?
- [ ] What's the total demo length? (Aim for 30-60 seconds)
- [ ] Does the demo tell a complete story?

### 6. File Organization

```
demos/
├── README.md                    # Documents all demos
├── <feature-name>/
│   ├── demo.tape               # VHS tape file
│   ├── demo.gif                # Generated output
│   └── demo.v1.gif (optional)  # Version history if needed
```

### 7. Testing and Iteration

After creating a tape file:

1. Generate the GIF: `vhs demo.tape`
2. Review the output:
   - Is text readable at all sizes?
   - Are timings natural (not too fast/slow)?
   - Does the flow make sense?
   - Is the terminal output clean?
3. Iterate if needed (save old versions as v1, v2, etc.)
4. Update README.md with demo description

### 8. Common Patterns for PRPM Demos

**Installation Demo:**
```tape
Type "npm install -g prpm"
Sleep 2s
Enter
Sleep 3s  # Show installation progress
```

**Search Demo:**
```tape
Type "prpm search <query>"
Enter
Sleep 7s  # Search results need more time
```

**Info Demo:**
```tape
Type "prpm info @prpm/<package-name>"
Enter
Sleep 5s  # Package details need reading time
```

**Install Demo:**
```tape
Type "prpm install @prpm/<package-name>"
Enter
Sleep 4s  # Installation is quick
```

**List Demo:**
```tape
Type "prpm list"
Enter
Sleep 4s  # Short list output
```

**File Viewing:**
```tape
Type "cat .claude/skills/<skill-name>.md"
Enter
Sleep 2s  # Just show it exists, don't need to read all
```

### 9. Quality Checklist

Before committing a demo:

- [ ] Standard configuration is used (FontSize 16, Width 1200, Height 900, Catppuccin Mocha)
- [ ] Timing feels natural when viewing
- [ ] Clear screens are used appropriately
- [ ] Commands demonstrate realistic usage
- [ ] Output is fully visible and readable
- [ ] Total length is reasonable (30-60 seconds ideal)
- [ ] Demo tells a complete story
- [ ] README.md is updated with demo description
- [ ] GIF is committed to git

### 10. README Documentation Template

When creating a new demo, add this section to README.md:

```markdown
### <Feature Name> Demo

Located in the `<feature-name>/` directory, this demo showcases:

1. [First step with command]
2. [Second step with command]
3. [Third step with command]

![Feature Demo](<feature-name>/demo.gif)

#### Regenerating the Demo

```bash
cd <feature-name>
vhs demo.tape
```
```

## Workflow

When a user asks you to create a VHS demo:

1. **Understand the workflow**: Ask clarifying questions about what needs to be demonstrated
2. **Plan the demo**: List out the commands and expected output
3. **Create the tape file**: Use standard configuration and timing guidelines
4. **Generate and review**: Run `vhs demo.tape` and review the output
5. **Iterate if needed**: Adjust timing or flow based on the result
6. **Document**: Update README.md with demo description
7. **Commit**: Add both .tape and .gif files to git

## Example Complete Workflow

```tape
# VHS documentation: https://github.com/charmbracelet/vhs

Output feature-demo.gif

# Set up the terminal
Set FontSize 16
Set Width 1200
Set Height 900
Set Theme "Catppuccin Mocha"

# Step 1: Show main command
Type "prpm search typescript"
Sleep 2s
Enter
Sleep 7s

Type "clear"
Enter

# Step 2: Get package info
Type "prpm info @prpm/typescript-best-practices"
Sleep 2s
Enter
Sleep 5s

Type "clear"
Enter

# Step 3: Install the package
Type "prpm install @prpm/typescript-best-practices"
Sleep 2s
Enter
Sleep 4s

# Step 4: Show it's installed
Type "prpm list"
Enter
Sleep 4s
```

## Common Mistakes to Avoid

1. **Inconsistent sizing**: Always use 1200x900, FontSize 16
2. **Too fast**: Users need time to read output
3. **Too slow**: Don't bore viewers with 10s+ waits
4. **No clear screens**: Scrollback can be overwhelming
5. **Missing Sleep before Enter**: Commands should be readable before execution
6. **Wrong theme**: Stick to Catppuccin Mocha for consistency
7. **Incomplete workflow**: Demo should show a complete user journey

## Summary

Every VHS demo should:
- Use standard configuration (FontSize 16, 1200x900, Catppuccin Mocha)
- Have natural timing (2-7s based on output length)
- Clear screen between major sections
- Tell a complete story
- Be documented in README.md
- Be reviewed before committing

When in doubt, follow the pattern in `install/demo.tape` as the reference implementation.
