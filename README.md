# CCConfig Homebrew Cask

## Seeding the tap repo

1. Create the GitHub repo `richeshgupta/homebrew-ccconfig` (empty).
2. Clone it locally:
   ```
   git clone https://github.com/richeshgupta/homebrew-ccconfig.git
   cd homebrew-ccconfig
   ```
3. Copy the cask file from this repo:
   ```
   mkdir -p Casks
   cp <ccconfig-repo>/distribution/homebrew-cask/Casks/ccconfig.rb Casks/
   git add Casks/ccconfig.rb
   git commit -m "chore: seed ccconfig cask"
   git push
   ```

## Required GitHub Actions secret

The release workflow auto-updates the cask after each stable release.
It needs push access to `richeshgupta/homebrew-ccconfig`.

1. Create a GitHub Personal Access Token (classic) with **`repo`** scope
   (or a fine-grained PAT scoped to `richeshgupta/homebrew-ccconfig`
   with Contents read/write).
2. In `richeshgupta/ccconfig` → Settings → Secrets → Actions, add:
   - **Name:** `HOMEBREW_TAP_PAT`
   - **Value:** the PAT you created

## User-facing install

```sh
brew tap richeshgupta/ccconfig
brew install --cask ccconfig
```

## Uninstall

```sh
brew uninstall --cask ccconfig
brew untap richeshgupta/ccconfig
```

## Notes

- The cask ships unsigned (no Apple Developer cert). macOS will show
  a Gatekeeper warning on first launch. Users must right-click → Open
  to approve, or run: `xattr -dr com.apple.quarantine /Applications/ccconfig.app`
- The `version` and `sha256` fields in `Casks/ccconfig.rb` are updated
  automatically by the `update-homebrew-tap` job in `.github/workflows/release.yml`
  on each stable tag push. Do not edit them manually in the tap repo.
