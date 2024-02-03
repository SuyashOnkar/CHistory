//
//  CHistoryApp.swift
//  CHistory
//
//  Created by Suyash Onkar on 02/02/2024.
//

import SwiftUI

@main
struct CHistoryApp: App {
    @State var currentNumber: String = "1"
    var body: some Scene {
        
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).square.fill") {
            Button("One") {
                currentNumber = "1"
            }
            .keyboardShortcut("1")
            Divider()
            Button("Two") {
                currentNumber = "2"
            }
            Button("Three") {
                currentNumber = "3"
            }
            MenuBarView()
            ContentView()
            
        }
        

    }
}
