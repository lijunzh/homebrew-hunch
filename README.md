# homebrew-hunch

Homebrew tap for [hunch](https://github.com/lijunzh/hunch) — a fast, offline
media filename parser.

## Install

```bash
brew install lijunzh/hunch/hunch
```

Or tap first, then install:

```bash
brew tap lijunzh/hunch
brew install hunch
```

## Update

```bash
brew upgrade hunch
```

## Maintainer Notes

To update the formula for a new release:

```bash
./update-formula.sh 0.4.0   # or whatever the new version is
git add . && git commit -m "hunch v0.4.0" && git push
```

The script downloads the release tarballs from GitHub, computes SHA256
hashes, and patches `Formula/hunch.rb` automatically.
