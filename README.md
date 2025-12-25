# Rock, Paper, Scissors – Brain Training Game

A SwiftUI mind training game built using **MVVM architecture**.  
The player must pick the correct counter move to either **WIN or intentionally LOSE** against the app.

---

## Game Rules

- Each round, the app randomly selects **Rock, Paper, or Scissors**
- The game alternates between **Win** and **Lose** prompts every turn
- The player must choose the correct move based on the prompt
  - **App chose: Rock + Prompt: Win → Player taps: Paper**
  - **App chose: Rock + Prompt: Lose → Player taps: Scissors**
- **Correct answer = +1 point**, **Wrong answer = –1 point**
- The game ends after **10 rounds**
- A **full-screen result screen** displays:
  - Score
  - Emoji feedback
  - Restart button
- Instant feedback includes:
  - **Haptic vibration**
  - **System sounds** for success/error

---

## Tech Stack

- Swift
- SwiftUI
- Architecture: **MVVM**
  - **Model:** `Move`, `GameResult`
  - **ViewModel:** `GameViewModel`
  - **View:** `ContentView`, `ResultView`
- Uses iOS built-in system feedback, no external sound files required for the first version

---

## Project Structure

- `Move.swift`
- `GameResult.swift`
- `GameViewModel.swift`
- `ContentView.swift`
- `ResultView.swift`

---

## Setup & Run

1. Open the project in **Xcode**
2. Run on Simulator or a real iOS device
3. Commit and push changes using Terminal or Source Control
