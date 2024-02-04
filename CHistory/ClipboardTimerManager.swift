import SwiftUI

class ClipboardTimerManager: ObservableObject {
    @Published var clipboardHistory: [String] = []
    @Published var isTimerRunning: Bool = false
    private var timer: Timer?

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if let copiedString = NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) {
                if let index = self.clipboardHistory.firstIndex(of: copiedString) {
                    // Move the recently copied item to the top
                    self.clipboardHistory.remove(at: index)
                }
                // Add the new item to the top
                self.clipboardHistory.insert(copiedString, at: 0)
                print(copiedString, Date())
            }
        }
        isTimerRunning = true
    }

    func stopTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }
}
