# KCAP Repacker for White Album 2

<div align="center">

![White Album 2](https://img.shields.io/badge/Game-White%20Album%202-blue)
![Python](https://img.shields.io/badge/Python-3.6%2B-green)
![License](https://img.shields.io/badge/License-MIT-yellow)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)

**A tool to repack KCAP (.pak) archives for White Album 2 modding**

[Features](#features) • [Installation](#installation) • [Usage](#usage) • [Troubleshooting](#troubleshooting) • [Credits](#credits)

</div>

---

## 📖 Overview

This tool allows you to repack extracted KCAP (.pak) files back into the game format for White Album 2. It's designed to work alongside [exkizpak](http://asmodean.reverse.net) extraction tool to enable easy modding of scripts, graphics, and other game assets.

### Why This Tool?

The original `exkizpak` by asmodean only extracts KCAP archives but doesn't provide repacking functionality. This tool fills that gap with:

- ✅ **Proper Shift-JIS encoding** for Japanese filenames (fonts work correctly!)
- ✅ **KCAP Version 2 format** support
- ✅ **Easy-to-use** batch file wrappers
- ✅ **No compression** (matches original format)
- ✅ **Tested and verified** with White Album 2

---

## 🎯 Features

- **✨ Shift-JIS Encoding**: Properly handles Japanese filenames like `14pt袋.tga` (font files)
- **📦 KCAP v2 Format**: Creates archives compatible with White Album 2
- **🚀 Multiple Usage Methods**: Interactive batch file, command-line, or Python script
- **🔧 Flexible Output**: Choose custom output filenames (e.g., `en.pak`, `script.pak`)
- **📊 Progress Feedback**: Shows packing progress for each file
- **⚠️ Error Handling**: Validates input and provides clear error messages
- **🎮 Game-Ready**: Output files are ready to use in White Album 2

---

## 📋 Requirements

- **Python 3.6+** ([Download here](https://www.python.org/downloads/))
  - ⚠️ During installation, check **"Add Python to PATH"**
- **Windows OS** (batch files are Windows-specific, but Python script works on any OS)
- **exkizpak** for extracting original .pak files ([Download here](http://asmodean.reverse.net))

---

## 📥 Installation

### Method 1: Download Release (Recommended)

1. Go to [Releases](../../releases) page
2. Download the latest `kcap_repacker_v1.1.zip`
3. Extract to a folder (e.g., `C:\Tools\KCAP_Repacker\`)
4. Done! Ready to use.

### Method 2: Clone Repository

```bash
git clone https://github.com/yourusername/kcap-repacker-wa2.git
cd kcap-repacker-wa2
```

---

## 🚀 Usage

### Quick Start (3 Steps)

1. **Extract** your .pak file using `exkizpak_v2.exe`:
   ```
   Drag .pak file onto exkizpak_v2.exe
   ```

2. **Edit** the files you want to modify (images, scripts, etc.)

3. **Repack** using this tool:
   ```
   Drag extracted folder onto repack_v1.1_interactive.bat
   ```

That's it! 🎉

---

### Detailed Usage Methods

#### 🎯 Method 1: Interactive Batch (Easiest)

**File:** `repack_v1.1_interactive.bat`

1. Drag your extracted folder onto the batch file
2. Enter desired output name when prompted (e.g., `en.pak`)
3. Confirm and wait for completion

```batch
Output filename: en.pak
Continue with repack? [Y/N] Y
✓ Success! Created: en.pak
```

#### ⚡ Method 2: Command Line (Flexible)

**File:** `repack_simple.bat`

```batch
repack_simple.bat <input_folder> <output.pak>
```

**Examples:**
```batch
# Repack to en.pak
repack_simple.bat extracted_en en.pak

# Repack to script.pak
repack_simple.bat C:\wa2\script_extracted script.pak

# Auto-name (uses folder name)
repack_simple.bat extracted_files
```

#### 🔧 Method 3: Python Direct (Advanced)

```bash
python kcap_repack_v1.1.py <input_folder> <output.pak>
```

**Examples:**
```bash
# Basic usage
python kcap_repack_v1.1.py extracted_en en.pak

# Full paths
python kcap_repack_v1.1.py "C:\wa2\extracted" "D:\mods\en.pak"
```

---

## 📂 File Structure

### Input Structure (After Extraction)

```
extracted_folder/
├── 1001.bnr          # Binary data
├── 1001.txt          # Script text
├── 1002.bnr
├── 1002.txt
├── 14pt袋.tga        # Font file (Japanese name)
├── bgm001.ogg        # Audio
├── cg001.tga         # Graphics
└── ...
```

### Output

```
en.pak                # Ready-to-use KCAP archive
```

---

## 📊 KCAP Format Details

### Technical Specifications

```
KCAP Version 2 Format:
┌─────────────────────────────────────┐
│ Header (16 bytes)                   │
│  - Signature: "KCAP" (4 bytes)      │
│  - Unknown1: 0x00000000 (4 bytes)   │
│  - Unknown2: 0x00000000 (4 bytes)   │
│  - Entry Count (4 bytes)            │
├─────────────────────────────────────┤
│ Entry Table (44 bytes × N entries)  │
│  - Compressed Flag (4 bytes)        │
│  - Filename (24 bytes, Shift-JIS)   │
│  - Unknown1 (4 bytes)               │
│  - Unknown2 (4 bytes)               │
│  - Data Offset (4 bytes)            │
│  - Data Length (4 bytes)            │
├─────────────────────────────────────┤
│ Data Section                        │
│  - Raw file data (concatenated)     │
└─────────────────────────────────────┘
```

### Encoding

- **Filename Encoding**: Shift-JIS (CP932)
- **Max Filename Length**: 23 bytes (24 with null terminator)
- **Compression**: None (raw data)
- **Byte Order**: Little-endian

---

## ⚠️ Important Notes

### Do's ✅

- ✅ **Backup** original .pak files before replacing
- ✅ **Keep** original filenames (don't rename extracted files)
- ✅ **Include** all files from extraction (don't delete unused files)
- ✅ **Test** in game after repacking

### Don'ts ❌

- ❌ Don't rename files with Japanese characters
- ❌ Don't use filenames longer than 23 bytes
- ❌ Don't mix files from different .pak archives
- ❌ Don't use special characters not supported by Shift-JIS

---

## 🐛 Troubleshooting

### Font/Text Appears Corrupted in Game

**Problem:** Japanese characters display as boxes or wrong characters

**Solution:** 
- Use `kcap_repack_v1.1.py` (NOT the old version)
- This version properly encodes Japanese filenames with Shift-JIS
- Font files like `14pt袋.tga` will work correctly

### "Python not found" Error

**Problem:** Windows can't find Python

**Solution:**
1. Download Python from [python.org](https://www.python.org/downloads/)
2. During installation, check **"Add Python to PATH"**
3. Restart your computer
4. Test: Open CMD and type `python --version`

### Game Crashes After Using Repacked .pak

**Problem:** Game won't start or crashes on load

**Solution:**
1. Verify all files were extracted completely
2. Check no files were renamed or deleted
3. Ensure output .pak size is similar to original
4. Restore backup and try repacking again

### "No files found" Error

**Problem:** Tool can't find files in the folder

**Solution:**
- Make sure you're pointing to the extracted folder (not the .pak file)
- Check folder actually contains files
- Verify folder path doesn't have special characters

---

## 🎮 Common White Album 2 Files

| Filename | Content | Common Edits |
|----------|---------|--------------|
| `script.pak` | Game scripts, dialogue | Translation, text fixes |
| `en.pak` | English translation files | Localization |
| `cg.pak` | CG graphics | Image modifications |
| `bgm.pak` | Background music | Audio replacement |
| `voice.pak` | Voice acting | Audio mods |
| `system.pak` | UI/system files | Interface changes |

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report Bugs**: Open an issue with details
2. **Suggest Features**: Share your ideas
3. **Submit PRs**: Fix bugs or add features
4. **Improve Docs**: Help make documentation clearer

### Development Setup

```bash
git clone https://github.com/yourusername/kcap-repacker-wa2.git
cd kcap-repacker-wa2
# Make your changes
# Test thoroughly
# Submit PR
```

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

- **exkizpak** by [asmodean](http://asmodean.reverse.net) - Original extraction tool
- **White Album 2** by Leaf/Aquaplus - Original game
- **Community Contributors** - Testing and feedback

---

## 📚 Additional Resources

- [Visual Novel Modding Guide](https://vndb.org)
- [White Album 2 on VNDB](https://vndb.org/v7771)
- [exkizpak Tools](http://asmodean.reverse.net)
- [GARbro Archive Explorer](https://github.com/morkt/GARbro)

---

## ⭐ Star This Project

If this tool helped you with your White Album 2 modding, please consider giving it a star! ⭐

It helps others find the tool and motivates continued development.

---

## 📧 Contact & Support

- **Issues**: [GitHub Issues](../../issues)
- **Discussions**: [GitHub Discussions](../../discussions)

---

<div align="center">

**Made with ❤️ for the White Album 2 modding community**

[⬆ Back to Top](#kcap-repacker-for-white-album-2)

</div>
