# Shoot The Apples

A 2D arcade game built with [Processing](https://processing.org/) (Java mode) as a first-year Java assignment.

Catch healthy apples in the basket, shoot worm apples with your bow, and avoid hitting birds or healthy apples, or it's game over.

## Gameplay

Apples fall from the top of the screen and drift toward the basket. Your goal is to **score points** by letting **healthy apples** land in the basket, while **shooting worm apples** before they reach it.

You lose if:
- A **worm apple** lands in the basket
- You shoot a **healthy apple**
- You shoot a **bird**

Your score is the number of healthy apples that reach the basket. High scores are saved locally in `HighScore.txt`.

## Controls

| Action | Input |
|--------|--------|
| Start / replay | Left mouse click (on start or game over screen) |
| Fire arrow | Left mouse click (during gameplay) |
| Aim | Move mouse (crosshair cursor) |

## How to Run

1. Install [Processing](https://processing.org/download)
2. Open the sketch folder in Processing (the folder containing `sketch_2D_Game_Assignment.pde`)
3. Click **Run** (▶)

**Requirements:** Processing 3.x or 4.x with Java mode enabled.

#


# Play without Processing (standalone download)

You can play the game **without installing Processing** by downloading the exported build for your computer from **[Dropbox](https://www.dropbox.com/scl/fo/to4o6culzbosc8crje6rn/AC15FQSjidtnepShs2UeEWs?rlkey=60slm2cay28ejwf163hy78b8c&st=6trdd2er&dl=0)**



The link contains six folders — download **only the one that matches your system**:
| Folder | Use on |
|--------|--------|
| `macos-aarch64` | Mac with Apple Silicon (M1 / M2 / M3 / M4) |
| `macos-x86_64` | Mac with Intel processor |
| `windows-amd64` | 64-bit Windows |
| `linux-amd64` | 64-bit Linux (Intel / AMD) |
| `linux-aarch64` | 64-bit ARM Linux (e.g. Raspberry Pi 4/5) |
| `linux-arm` | 32-bit ARM Linux |

**Before you start**
- Download and **unzip** the folder completely - do not run the game from inside the zip.
- Keep all files together (`data/`, `lib/`, and the game file must stay in the same folder).
- These builds are unsigned — your operating system may warn you the first time. That is normal.

---

Please follow the instructions below for your operating system, to work around this warning and play the game.

### macOS

1. Download and extract the correct Mac folder from Dropbox.
2. **Right-click** the **`.app`** file and click **Copy**.
3. Open **Terminal**, type `xattr -cr ` (with a space at the end), **paste** the file, press **Enter**.
   Example after paste:
   ```bash
   xattr -cr '/Users/YourName/Downloads/macos-aarch64/sketch_2D_Game_Assignment (2) (1) (1) (1) (1)(123) copy.app'


### Linux

1. Download and extract the correct Linux folder from Dropbox.
2. **Right-click** the Unix executable file (which has no extension) and click **Copy**.
3. Open **Terminal** and **paste** the file, press **Enter**.
    Example after paste:
   ```bash
   '/Users/YourName/Downloads/macos-aarch64/sketch_2D_Game_Assignment (2) (1) (1) (1) (1)(123) copy'


### Windows

1. Download and extract the Windows folder from Dropbox.
2. **Right-click** the **`.exe`** file and click **Copy**.
3. Open **PowerShell** or **Command Prompt**, type `& ` (with a space at the end), **paste** the file, press **Enter**.
   Example after paste:
   ```powershell
   & "C:\Users\YourName\Downloads\windows-amd64\sketch_2D_Game_Assignment (2) (1) (1) (1) (1)(123) copy.exe"


#


# Project Structure

## Technical Features

- **Classes:** Custom types including `Apple`, `HealthyApples`, `WormApples`, `Arrow`, `Bird`, and `SlicedApples`
- **Inheritance:** `HealthyApples` and `WormApples` extend the abstract `Apple` class
- **Abstract class:** `Apple` defines shared behaviour and abstract methods for subclasses
- **Polymorphism:** Shared `ArrayList<Apple>` with runtime method dispatch (`update()`, `loadImages()`, `isWorm()`)
- **Encapsulation:** Each class groups its own fields, constructor, and methods
- **State machine:** `States` enum manages start menu, gameplay, and game over screens
- **Collision detection:** Arrows vs. apples and birds
- **Sprite animation:** Multi-frame apple, bird, and sliced-apple animations
- **File storing for high score:** Read/write via `loadStrings()` and `saveStrings()`

## Image Credits

Asset sources and attributions are listed in [`ImageCredits.rtf`](ImageCredits.rtf).

## Author

Joseph Ashworth — [GitHub](https://github.com/JosephAshworth)

## License

Academic project. Image assets remain subject to their original sources (see `ImageCredits.rtf`).
