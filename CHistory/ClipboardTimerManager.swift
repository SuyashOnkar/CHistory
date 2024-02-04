//
//  ClipboardTimerManager.swift
//  CHistory
//
//  Created by Suyash Onkar on 04/02/2024.
//

import SwiftUI

class ClipboardTimerManager: ObservableObject {
    @Published var clipboardHistory: [String] = []
    @Published var lastCopiedString: String?
    @Published var isTimerRunning: Bool = false
    private var timer: Timer?

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if let copiedString = NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string),
               copiedString != self.lastCopiedString {
                self.clipboardHistory.append(copiedString)
                self.lastCopiedString = copiedString
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

