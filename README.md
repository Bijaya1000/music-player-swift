# 🎵 SwiftUI Music Player App

A simple and clean **iOS Music Player app** built with **SwiftUI** and **AVFoundation**. It plays local `.mp3` files bundled with the app and displays playback progress with a slider.

## ✨ Features

- ✅ Play/Pause music
- ✅ Real-time playback progress
- ✅ Slider to seek through the track
- ✅ Song title display
- ✅ Simple and minimal SwiftUI interface

---

## 📱 Screenshots

| Home View |
|-----------|
| ![Music Player Screenshot](#) |

---

## 🚀 Getting Started

### Prerequisites

- macOS with **Xcode 14+**
- iOS 14+ target
- Basic knowledge of Swift & SwiftUI

### Setup Instructions

1. Clone or download the repository.

2. Open the project in Xcode.

3. Drag your `.mp3` file(s) into the **Xcode Project Navigator**.

   > Example:
   > - `song1.mp3`

4. Open `ContentView.swift` and update the `song` variable:

   ```swift
   let song = "song1" // Replace with your song file name (without extension)
