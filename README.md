# EmojiSearch

A really good and fast Alfred workflow for finding and pasting emoji 🚀

## Installation

Grab the [latest release](https://github.com/HipsterJazzbo/AlfredEmojiSearch/releases/latest) and open it with Alfred 👍

## Usage

By default, you can activate workflow either by typing `e` in Alfred, or using the keyboard shortcut `command+shift+e`. Type a search term, pick the emoji you and want and hit `enter` — the selected emoji will be pasted into the active window 😎

If you want to see what terms are available for a given emoji, search for the emoji instead and the terms for that emoji will show.

## Index

All of the search terms are stored in `index.json` and read in at runtime. This means you can open it up and add your own search terms for whatever emoji you want and it'll be available immediately. If you think it'd be useful to everyone else, go ahead and open a pull request 🙏

> Note: The initial version of the index was built from Apple's internal list, so anything that works on your iOS keyboard autocomplete should work here too.

## Building

If you want to hack on this workflow:

1. Make sure you've got Swift installed on your system
2. Create a new workflow in Alfred and replace the copy path in `./go` with it
3. Run `./go`. It'll build the executable, and copy it to your workflow directory.
4. Make sure you've got a copy of `index.json` in your workflow directory as well, the executable just look for it in the current directory.

## Todo

Feel free to do one of these and open a pull request 😊

- [ ] Everything needs icons
- [ ] Figure out why the ~150ms delay on activation and if there's anything I can do about it
- [ ] And an `option`-select action to just copy without pasting
