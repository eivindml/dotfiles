# `dotfiles`

Minimalist dotfiles configuration, now using Swift scripting.

## Usage

```
./bootstrap
```

⚠️ Warning, this will find all dotfiles and folders in your dotfiles directory, and delete the corresponding ones from your home directory, and then symlink them back.

## Action

Added workflow action to copy dotfiles to server.

## Scripts

Cheat sheet.

```bash
swift package init --type executable
swift package generate-xcodeproj
```

Testing:

```bash
swift run
```

Intalling:

```
swift build -c release
cp .build/release/script-name ../../bin
```
