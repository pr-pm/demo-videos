# PRPM Demos

This repository contains demo materials for [PRPM](https://github.com/pr-pm/prpm) - The Package Manager for AI Prompts.

**Stop copy-pasting prompts from GitHub.** Install Cursor rules, Claude skills, and AI agents like npm packages.

## What is PRPM?

PRPM is a universal package manager that works with **any AI editor** (Cursor, Claude Code, Continue, Windsurf, GitHub Copilot, Kiro). It provides:

- **1,300+ packages** - Cursor rules, Claude skills/agents, Windsurf rules, MCP configs
- **Collections** - Complete workflow setups in one command
- **Universal packages** - Install once, use anywhere (format conversion happens server-side)
- **Auto-updates** - Version control and dependency handling

## Demos

### Install Demo

Located in the `install/` directory, this demo showcases the core PRPM workflow:

1. Installing PRPM globally with `npm install prpm -g`
2. Searching for packages with `prpm search pulumi`
3. Viewing package details with `prpm info @prpm/pulumi-troubleshooting-skill`
4. Installing a skill with `prpm install @prpm/pulumi-troubleshooting-skill`
5. Listing installed packages with `prpm list`
6. Viewing the installed skill file in `.claude/skills/`

![Install Demo](install/demo.gif)

### Regenerating the Demo

The demo is created using [VHS](https://github.com/charmbracelet/vhs). To regenerate:

```bash
cd install
vhs demo.tape
```

This will generate `demo.gif` showing the complete installation and usage flow.

## Quick Start

```bash
# Install PRPM
npm install -g prpm

# Install a complete setup (multiple packages)
prpm install collection/nextjs-pro

# Or install individual packages
prpm install test-driven-development
prpm install karen-skill
```

## Learn More

- **[Main Repository](https://github.com/pr-pm/prpm)** - Full documentation and source code
- **[Package Catalog](https://github.com/pr-pm/prpm/blob/main/docs/PACKAGES.md)** - Browse 1,300+ available packages
- **[Collections Guide](https://github.com/pr-pm/prpm/blob/main/docs/COLLECTIONS.md)** - Multi-package bundles
- **[CLI Reference](https://github.com/pr-pm/prpm/blob/main/docs/CLI.md)** - Complete command documentation
