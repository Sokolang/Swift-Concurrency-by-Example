//
// From Swift Concurrency by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/concurrency
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import Foundation

func fetchFavorites() async throws -> [Int] {
    let url = URL(string: "https://hws.dev/user-favorites.json")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([Int].self, from: data)
}

@main
struct App {
    static func main() async {
        if let favorites = try? await fetchFavorites() {
            print("Fetched \(favorites.count) favorites.")
        } else {
            print("Failed to fetch favorites.")
        }
    }
}
