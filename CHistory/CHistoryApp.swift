//
//  CHistoryApp.swift
//  CHistory
//
//  Created by Suyash Onkar on 02/02/2024.
//

import SwiftUI

@main
struct CHistoryApp: App {
    @StateObject private var timerManager = ClipboardTimerManager()
    @State private var selectedClipboardItem: String?
    
    var body: some Scene {
        MenuBarExtra("clipboard", systemImage: "list.clipboard") {
            VStack {
                Button(action: {
                    if timerManager.isTimerRunning {
                        timerManager.stopTimer()
                    } else {
                        timerManager.startTimer()
                    }
                }) {
                    Text(timerManager.isTimerRunning ? "Stop Timer" : "Start Timer")
                }
                
                Divider()
                
                ClipboardHistoryView(clipboardHistory: timerManager.clipboardHistory)
                
                
                
            }
        }
        .environmentObject(timerManager)
    }
}






