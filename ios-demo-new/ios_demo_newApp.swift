import SwiftUI

import Localazy_iOS

@main
struct ios_demo_newApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().task {
//                Bundle.swizzleLocalizationWithLocalazy()
                    await Localazy.shared.forceReload()
                print(Localazy.shared.getCurrentLocale())
                print(Localazy.shared.getCurrentLocalazyLocale())
                print(Localazy.shared.getString(for:"All Sessions"))
            }
        }
    }
}
