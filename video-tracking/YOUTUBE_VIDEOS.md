# PRPM YouTube Video Ledger

This file tracks all PRPM demo videos posted to YouTube.

## Posted Videos

### 1. Install Demo
- **YouTube URL**: https://youtu.be/WIvQdrfVJ1A
- **Title**: Using prpm to install a custom claude code skill
- **Command**: `prpm install`
- **Local File**: `demos/install/demo.mp4`
- **Duration**: ~1 minute
- **Posted**: October 29, 2024
- **Status**: ✅ Published

---

## Pending Videos (Ready to Upload)

### 2. Search Demo
- **Command**: `prpm search`
- **Local File**: `demos/search/demo.mp4`
- **Features**: Basic search, --subtype filter, --format filter, --author filter
- **Suggested Title**: "Search Packages with PRPM - Filter by Type & Author | Quick Tutorial"
- **Status**: ⏳ Ready for upload

### 3. Info Demo
- **Command**: `prpm info`
- **Local File**: `demos/info/demo.mp4`
- **Features**: View package details
- **Suggested Title**: "View Package Details with PRPM Info Command | Tutorial"
- **Status**: ⏳ Ready for upload

### 4. List Demo
- **Command**: `prpm list`
- **Local File**: `demos/list/demo.mp4`
- **Features**: List installed packages
- **Suggested Title**: "List Installed Packages with PRPM | Package Management"
- **Status**: ⏳ Ready for upload

### 5. Uninstall Demo
- **Command**: `prpm uninstall`
- **Local File**: `demos/uninstall/demo.mp4`
- **Features**: Uninstall workflow with before/after verification
- **Suggested Title**: "Uninstall Packages with PRPM - Clean Package Removal | Tutorial"
- **Status**: ⏳ Ready for upload

### 6. Trending Demo
- **Command**: `prpm trending`
- **Local File**: `demos/trending/demo.mp4`
- **Features**: View trending packages
- **Suggested Title**: "Discover Trending Packages with PRPM | Popular Claude Skills"
- **Status**: ⏳ Ready for upload

### 7. Popular Demo
- **Command**: `prpm popular`
- **Local File**: `demos/popular/demo.mp4`
- **Features**: View most popular packages
- **Suggested Title**: "Find Popular PRPM Packages - Most Downloaded Skills & Agents"
- **Status**: ⏳ Ready for upload

---

## Video Metadata Template

When posting a new video, update this ledger with:

```markdown
### X. [Command Name] Demo
- **YouTube URL**: https://youtu.be/[VIDEO_ID]
- **Title**: [Actual title used on YouTube]
- **Command**: `prpm [command]`
- **Local File**: `demos/[command]/demo.mp4`
- **Duration**: ~X minutes
- **Posted**: [Date]
- **Status**: ✅ Published
- **Tags Used**: [comma-separated list if different from base]
- **Views**: [Update periodically]
- **Notes**: [Any special considerations]
```

---

## Base Tags for All Videos

```
prpm,claude code,claude ai,anthropic claude,ai coding assistant,package manager,developer tools,coding tutorial,claude skills,claude agents,prompt engineering,ai tools,cursor alternative,vscode ai,prpm tutorial,claude code setup,ai development,developer productivity,npm package,command line tools,terminal tutorial,ai programming,code automation,software development,programming tutorial,tech tutorial,developer workflow,ai integration
```

---

## Playlist Organization

**Main Playlist**: PRPM Tutorials
- All command demos in order: install → search → info → list → uninstall → trending → popular

**Suggested Additional Playlists**:
- "PRPM Getting Started" (install, search, info)
- "PRPM Package Management" (install, list, uninstall, update, upgrade)
- "PRPM Discovery" (search, trending, popular, collections)
- "PRPM Configuration" (config commands, telemetry)

---

## Performance Tracking

| Video | Views | Watch Time | CTR | Avg View Duration | Top Traffic Source |
|-------|-------|------------|-----|-------------------|-------------------|
| Install | - | - | - | - | - |
| Search | - | - | - | - | - |
| Info | - | - | - | - | - |
| List | - | - | - | - | - |
| Uninstall | - | - | - | - | - |
| Trending | - | - | - | - | - |
| Popular | - | - | - | - | - |

*Update this table weekly with YouTube Analytics data*

---

## Next Videos to Create

### Phase 3: Package Creation
- [ ] `prpm init` - Initialize new package
- [ ] `prpm publish` - Publish package to registry
- [ ] `prpm schema` - View package schema

### Phase 4: Configuration & Auth
- [ ] `prpm config list` - View configuration
- [ ] `prpm config get` - Get config value
- [ ] `prpm config set` - Set config value
- [ ] `prpm login` - Authenticate with registry
- [ ] `prpm whoami` - Show current user

### Phase 5: Utilities
- [ ] `prpm index` - Index local files
- [ ] `prpm outdated` - Check for updates
- [ ] `prpm update` - Update packages
- [ ] `prpm upgrade` - Upgrade all packages
- [ ] `prpm collections` - Browse collections
- [ ] `prpm telemetry` - Manage telemetry settings

---

## Notes

- All videos use Catppuccin Mocha theme for consistency
- Standard resolution: 1200x900, FontSize 16
- All MP4 files are in respective `demos/[command]/demo.mp4` locations
- GIF versions also available for documentation at `demos/[command]/demo.gif`
- Update this ledger immediately after posting each video
- Include actual YouTube URLs as soon as videos are published
