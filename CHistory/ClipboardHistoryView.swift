import SwiftUI

struct ClipboardHistoryView: View {
    var clipboardHistory: [String]
    
    var body: some View {
        ScrollView {
            ForEach(clipboardHistory.reversed(), id: \.self) { item in
                Button(item.trimmingCharacters(in: .whitespacesAndNewlines)) {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(item, forType: .string)
                }
            }
        }
        .padding()
        
    }
}

struct CleanClipboardItemView: View {
    var item: String

    var body: some View {
        Text(cleanedItem)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    var cleanedItem: String {
        return item.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
