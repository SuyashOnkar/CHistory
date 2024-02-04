import SwiftUI

class ClipboardTimerManager: ObservableObject {
    @Published var clipboardHistory: [String] = []
    @Published var isTimerRunning: Bool = false
    private var timer: Timer?
    private let maxHistoryEntries = 10

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if let copiedString = NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) {
                if let index = self.clipboardHistory.firstIndex(of: copiedString) {
                    self.clipboardHistory.remove(at: index)
                }
                self.clipboardHistory.insert(copiedString, at: 0)

                if self.clipboardHistory.count > self.maxHistoryEntries {
                    self.clipboardHistory.removeLast()
                }

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
