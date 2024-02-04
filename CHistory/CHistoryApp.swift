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
        MenuBarExtra("clipboard", systemImage: "scroll.fill") {
            VStack {
                Button(action: {
                    if timerManager.isTimerRunning {
                        timerManager.stopTimer()
                    } else {
                        timerManager.startTimer()
                    }
                }) {
                    HStack {
                        Image(systemName: timerManager.isTimerRunning ? "stop.circle.fill" : "play.circle.fill")
                            .imageScale(.small)
                        
                        Text(timerManager.isTimerRunning ? "Stop Capturing" : "Start Capturing")
                    }

                }
                
                Divider()
                
                ClipboardHistoryView(clipboardHistory: timerManager.clipboardHistory)
                
                
                
            }
        }
        .environmentObject(timerManager)
    }
}





