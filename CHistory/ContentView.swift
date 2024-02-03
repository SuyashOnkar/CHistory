//
//  ContentView.swift
//  CHistory
//
//  Created by Suyash Onkar on 02/02/2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    var body: some View {
        Text("Hello").onTapGesture{
            print(Date())
            print(NSPasteboard.general.string(forType: NSPasteboard.PasteboardType.string) ?? "not found")
        }
        Text("Madarchod")
            .onTapGesture{
                let lamo: String = "LAMO"
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(lamo, forType:.string)
            }
        
            .padding()
    }
}

#Preview {
    ContentView()
}
