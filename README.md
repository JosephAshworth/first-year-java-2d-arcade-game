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
