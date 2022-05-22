//
// From Swift Concurrency by Example by Paul Hudson
// https://www.hackingwithswift.com/quick-start/concurrency
//
// You're welcome to use this code for any purpose,
// commercial or otherwise, with or without attribution.
//

import Foundation

func doAsyncWork() async {
    print("Doing async work")
}

func doRegularWork() {
    Task {
        await doAsyncWork()
    }
}

@main
struct App {
    static func main() {
        doRegularWork()
    }
}
