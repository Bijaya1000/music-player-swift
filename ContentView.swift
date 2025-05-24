import SwiftUI

struct ContentView: View {
    @StateObject private var musicPlayer = MusicPlayer()
    let song = "song1" // name of the .mp3 file (without extension)

    var body: some View {
        VStack(spacing: 40) {
            Text("🎶 Music Player")
                .font(.largeTitle)
                .bold()

            Text("Now Playing: \(song).mp3")
                .font(.headline)

            Slider(value: $musicPlayer.currentTime,
                   in: 0...musicPlayer.duration,
                   onEditingChanged: { editing in
                       if !editing {
                           musicPlayer.seek(to: musicPlayer.currentTime)
                       }
                   })

            HStack {
                Text(formatTime(musicPlayer.currentTime))
                Spacer()
                Text(formatTime(musicPlayer.duration))
            }
            .font(.caption)
            .padding(.horizontal)

            Button(action: {
                musicPlayer.playPause()
            }) {
                Text(musicPlayer.isPlaying ? "Pause" : "Play")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .onAppear {
            musicPlayer.load(song: song)
        }
    }

    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
