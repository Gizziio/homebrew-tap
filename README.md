# Allternit Homebrew Tap

Official Homebrew tap for Allternit Desktop and CLI tools.

## What is Homebrew?

Homebrew is the most popular package manager for macOS. It's how power users install apps.

| App | Homebrew Install |
|-----|-----------------|
| **Cursor** | `brew install --cask cursor` |
| **Ollama** | `brew install --cask ollama` |
| **Zed** | `brew install --cask zed` |
| **Warp** | `brew install --cask warp` |
| **Docker** | `brew install --cask docker` |
| **Allternit** | `brew install --cask allternit` ← you are here |

## Quick Start

```bash
# Add the Allternit tap (one time)
brew tap allternit/tap

# Install Allternit Desktop
brew install --cask allternit

# Install Gizzi Code CLI
brew install gizzi-code

# Upgrade when a new version is released
brew upgrade --cask allternit
```

## Available Formulae & Casks

| Name | Type | Description |
|------|------|-------------|
| `allternit` | Cask | Allternit Desktop — the full Electron app with bundled backend |
| `gizzi-code` | Formula | Gizzi Code CLI — AI terminal agent (`gizzi`) |

## Repository Structure

```
Casks/
  allternit.rb          # Desktop app cask
Formula/
  gizzi-code.rb         # Gizzi Code CLI formula
README.md               # This file
```

## How It Works

1. Homebrew downloads the DMG from GitHub Releases
2. Mounts the DMG silently
3. Copies `Allternit Desktop.app` to `/Applications`
4. Sets up `brew upgrade --cask allternit` for future updates
5. `brew uninstall --cask allternit` removes the app and cleans up support files

## Updating the Cask

When a new version is released:

```bash
# 1. Get the new SHA256
shasum -a 256 Allternit-Desktop-1.0.1-arm64.dmg
# → abc123...

# 2. Edit Casks/allternit.rb
#    - Update version
#    - Update sha256 for each architecture

# 3. Commit and push
git add Casks/allternit.rb
git commit -m "allternit 1.0.1"
git push origin main
```

Users will see the update via `brew outdated` or `brew upgrade`.

## Manual Install (Without Homebrew)

If you don't use Homebrew:

```bash
# Download and install manually
curl -fsSL https://install.allternit.com | bash
```

Or download the DMG directly from [GitHub Releases](https://github.com/allternit/desktop/releases).

## Support

- **Docs**: https://docs.allternit.com
- **Issues**: https://github.com/allternit/desktop/issues
- **Website**: https://allternit.com
