# PRPM Video Content Manifest

**Quick Overview** | Last Updated: 2025-11-04
- Published: 1 video
- Ready to upload: 7 videos
- In production: 0 videos

---

## Published Videos

### Command Demos

| Command | YouTube URL | Posted | Duration | Status |
|---------|-------------|--------|----------|--------|
| install | https://youtu.be/WIvQdrfVJ1A | 2024-10-29 | ~1 min | ✅ Live |

### Feature Demos

| Feature | YouTube URL | Posted | Duration | Status |
|---------|-------------|--------|----------|--------|
| - | - | - | - | - |

---

## Ready to Upload

### Command Demos (Priority 1)

- [ ] **search** - `demos/search/demo.mp4`
  - Title: "Search Packages with PRPM - Filter by Type & Author | Quick Tutorial"
  - Features: Basic search, --subtype filter, --format filter, --author filter

- [ ] **info** - `demos/info/demo.mp4`
  - Title: "View Package Details with PRPM Info Command | Tutorial"
  - Features: View package details and metadata

- [ ] **list** - `demos/list/demo.mp4`
  - Title: "List Installed Packages with PRPM | Package Management"
  - Features: List all installed packages

- [ ] **uninstall** - `demos/uninstall/demo.mp4`
  - Title: "Uninstall Packages with PRPM - Clean Package Removal | Tutorial"
  - Features: Uninstall workflow with before/after verification

- [ ] **trending** - `demos/trending/demo.mp4`
  - Title: "Discover Trending Packages with PRPM | Popular Claude Skills"
  - Features: View trending packages

- [ ] **popular** - `demos/popular/demo.mp4`
  - Title: "Find Popular PRPM Packages - Most Downloaded Skills & Agents"
  - Features: View most popular packages

### Feature Demos (Priority 2)

- [ ] **self-improve** - `demos/self-improve/demo.mov`
  - Title: "Self-Improving Cursor AI with PRPM | Package Manager Demo"
  - Features: Cursor AI auto-discovers and installs PRPM packages
  - Duration: ~2:38
  - Metadata: `demos/self-improve/youtube-metadata.md`
  - Special: Cursor AI integration demo (not Claude Code)

---

## Production Pipeline

### Phase 3: Package Creation
- [ ] **init** - Initialize new package
- [ ] **publish** - Publish package to registry
- [ ] **schema** - View package schema

### Phase 4: Configuration & Auth
- [ ] **config list** - View all configuration
- [ ] **config get** - Get specific config value
- [ ] **config set** - Set config value
- [ ] **config delete** - Remove config value
- [ ] **login** - Authenticate with registry
- [ ] **whoami** - Show current authenticated user

### Phase 5: Utilities
- [ ] **index** - Index local files
- [ ] **index -v** - Index with verbose output
- [ ] **outdated** - Check for package updates
- [ ] **update** - Update specific packages
- [ ] **upgrade** - Upgrade all packages
- [ ] **collections** - Browse package collections
- [ ] **telemetry enable** - Enable telemetry
- [ ] **telemetry disable** - Disable telemetry
- [ ] **telemetry status** - Check telemetry status

---

## Metadata Reference

### Base Tags for All Videos (473 characters)

```
prpm,claude code,claude ai,anthropic claude,ai coding assistant,package manager,developer tools,coding tutorial,claude skills,claude agents,prompt engineering,ai tools,cursor alternative,vscode ai,prpm tutorial,claude code setup,ai development,developer productivity,npm package,command line tools,terminal tutorial,ai programming,code automation,software development,programming tutorial,tech tutorial,developer workflow,ai integration
```

### Standard Video Settings

**VHS Configuration:**
- Font Size: 16
- Width: 1200
- Height: 900
- Theme: Catppuccin Mocha
- Framerate: 60 (MP4 only)
- Output: Both GIF and MP4

**File Locations:**
- GIF: `demos/[command]/demo.gif`
- MP4: `demos/[command]/demo.mp4`
- High-quality: `demos/[command]/demo-youtube.mp4`

### Video Posting Template

When publishing a new video, update the Published Videos section:

```markdown
| [command] | https://youtu.be/[VIDEO_ID] | YYYY-MM-DD | ~X min | ✅ Live |
```

Then move the entry from "Ready to Upload" and add these details in a comment:

```markdown
<!--
Video Details: [Command Name]
- Posted: [Date]
- Views: [Update periodically]
- Watch Time: [From analytics]
- CTR: [From analytics]
- Top Traffic Source: [From analytics]
- Notes: [Any special considerations]
-->
```

---

## Playlist Organization

### Main Playlists

**PRPM Tutorials** (Main playlist)
- All videos in logical order: install → search → info → list → uninstall → trending → popular

**Getting Started with PRPM**
- install, search, info (beginner-friendly subset)

**Package Management**
- install, list, uninstall, update, upgrade, outdated

**Package Discovery**
- search, trending, popular, collections

**Advanced Features**
- config commands, login/whoami, telemetry, index, self-improve

---

## Performance Tracking

### Analytics Summary

| Video | Views | Watch Time | CTR | Avg Duration | Top Source |
|-------|-------|------------|-----|--------------|------------|
| install | - | - | - | - | - |
| search | - | - | - | - | - |
| info | - | - | - | - | - |
| list | - | - | - | - | - |
| uninstall | - | - | - | - | - |
| trending | - | - | - | - | - |
| popular | - | - | - | - | - |
| self-improve | - | - | - | - | - |

*Update weekly from YouTube Analytics*

### Goals

- [ ] Reach 1,000 subscribers
- [ ] 10,000 total views across all videos
- [ ] Average watch time > 70%
- [ ] CTR > 5%
- [ ] Create full command coverage (all prpm commands)

---

## Notes & Best Practices

### Video Production
- All videos use Catppuccin Mocha theme for brand consistency
- Standard resolution: 1200x900, FontSize 16
- Generate both GIF (for docs) and MP4 (for YouTube)
- Use `generate-hq-video.sh` for YouTube uploads to get better quality
- Always include timestamps in descriptions (minimum 3 for chapters)

### Metadata
- Titles under 60 characters for full display
- Tags up to 500 characters maximum
- Always include 3-5 hashtags in description
- Front-load important keywords in titles
- Include "PRPM" in every title for branding

### Content Updates
- Update this manifest immediately after posting videos
- Add YouTube URLs as soon as published
- Update analytics weekly
- Check for outdated information monthly
- Keep production pipeline prioritized

### Command-Specific Considerations
- **search**: Always use `--no-interactive` flag in demos
- **login**: Mask sensitive information, use placeholder tokens
- **config**: Show safe config values only
- **self-improve**: Cursor-specific, not Claude Code

---

## Links

- [PRPM Website](https://prpm.dev)
- [PRPM GitHub](https://github.com/khaliqgant/prpm)
- [Documentation](https://prpm.dev/docs)
- [VHS Demo Creation Skill](../.claude/skills/prpm-vhs-demo-creation-methodology/SKILL.md)
