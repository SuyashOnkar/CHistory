import SwiftUI

struct ClipboardHistoryView: View {
    var clipboardHistory: [String]
    let maxCharactersToShow = 20

    var body: some View {
        ScrollView {
            ForEach(clipboardHistory, id: \.self) { item in
                Button {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(item, forType: .string)
                } label: {
                    Text(getButtonText(for: item))
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
        }
        .padding()
    }

    private func getButtonText(for item: String) -> String {
        let strippedItem = item.trimmingCharacters(in: .whitespacesAndNewlines)
        if strippedItem.count > maxCharactersToShow {
            return String(strippedItem.prefix(maxCharactersToShow)) + "..."
        } else {
            return strippedItem
        }
    }
}
