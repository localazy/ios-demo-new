import SwiftUI

import Localazy_iOS

@main
struct ios_demo_newApp: App {
    
    @StateObject private var settings = AppSettings()
    
    
    var body: some Scene {
        WindowGroup {
            if settings.didLoadLocalizedStrings {
                ContentView()                
            } else {
                // Optionally show a loading or splash screen while waiting
                ProgressView("Loading...").task {
                    await Localazy.shared.forceReload()
                    print(Localazy.shared.getCurrentLocale())
                    print(Localazy.shared.getCurrentLocalazyLocale())
                    print(Localazy.shared.getString(for:"All Sessions"))
                }
            }
        }
    }
}
