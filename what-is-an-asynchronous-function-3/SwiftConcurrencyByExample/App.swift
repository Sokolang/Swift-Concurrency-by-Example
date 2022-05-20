//
// From Swift Concurrency by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/concurrency
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import Foundation

func fetchNews() async -> Data? {
    do {
        let url = URL(string: "https://hws.dev/news-1.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    } catch {
        print("Failed to fetch data")
        return nil
    }
}

@main
struct App {
    static func main() async {
        if let data = await fetchNews() {
            print("Downloaded \(data.count) bytes")
        } else {
            print("Download failed.")
        }
    }
}
