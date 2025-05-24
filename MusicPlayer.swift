import AVFoundation

class MusicPlayer: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = 0
    var duration: TimeInterval = 0

    private var player: AVAudioPlayer?
    private var timer: Timer?

    func load(song: String) {
        if let url = Bundle.main.url(forResource: song, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                duration = player?.duration ?? 0
                player?.prepareToPlay()
            } catch {
                print("Error loading audio: \(error)")
            }
        }
    }

    func playPause() {
        guard let player = player else { return }

        if player.isPlaying {
            player.pause()
            stopTimer()
            isPlaying = false
        } else {
            player.play()
            startTimer()
            isPlaying = true
        }
    }

    func seek(to time: TimeInterval) {
        player?.currentTime = time
        currentTime = time
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.currentTime = self.player?.currentTime ?? 0
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
