# KCAP Repacker for White Album 2

A tool to repack extracted KCAP (`.pak`) archives for White Album 2 modding. Designed to work alongside **exkizpak**.

## Features
* **Shift-JIS Support:** Correctly handles Japanese filenames (e.g., `14pt袋.tga`).
* **Easy Usage:** Simple drag-and-drop batch script.
* **No Compression:** Matches the original game format perfectly.

## Requirements
* Python 3.6+
* exkizpak (to extract the original files)

## How to Use
1. Extract your `.pak` file using `exkizpak`.
2. Edit your files (scripts, images, etc.).
3. **Drag and drop** the extracted folder onto `repack_v1.1_interactive.bat`.
4. Type the desired output name (e.g., `en.pak`) and hit Enter.

> **Note:** Do not rename the extracted files, especially those with Japanese characters, or the game might crash.
