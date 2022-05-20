//
// From Swift Concurrency by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/concurrency
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import SwiftUI

struct ContentView: View {
    @State private var site = "https://"
    @State private var sourceCode = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Website address", text: $site)
                    .textFieldStyle(.roundedBorder)
                Button("Go") {
                    Task {
                        await fetchSource()
                    }
                }
            }
            .padding()

            ScrollView {
                Text(sourceCode)
            }
        }
    }

    func fetchSource() async {
        do {
            let url = URL(string: site)!
            let (data, _) = try await URLSession.shared.data(from: url)
            sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            sourceCode = "Failed to fetch \(site)"
        }
    }
}