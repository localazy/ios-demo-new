import Combine
import SwiftUI

class AppSettings: ObservableObject {
    @Published var didLoadLocalizedStrings: Bool = false
    var cancellables: Set<AnyCancellable> = []

    init() {
        NotificationCenter.default.publisher(for: .localazyStringsLoaded)
                    .map { notification -> Bool in
                        // Log to the console that the event was received
                        print("Received localazyStringsLoaded notification")
                        return true
                    }
                    .assign(to: \.didLoadLocalizedStrings, on: self)
                    .store(in: &cancellables)
    }
}
