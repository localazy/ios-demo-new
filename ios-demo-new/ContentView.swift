
import SwiftUI
import Localazy_iOS

struct ContentView: View {
    private var sessions: [Session] {
        loadSessionData()
    }
    private var todaysSession: Session? {
        sessions.first
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                GeometryReader { geometry in
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.safeAreaInsets.top + 200)
                        .clipped()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                        )
                }.frame(height: 200) // Fixed height for the image area
                // List
                List {                    
                    if let todaysSession = todaysSession {
                        Section(header: Text(localazyKey: "Today's Session")) {
                            NavigationLink(destination: SessionDetailView(session: todaysSession)) {
                                Text(todaysSession.name)
                            }
                        }
                    } else {
                        Section(header: Text(localazyKey: "Today's Session")) {
                            Text(localazyKey: "No session today")
                        }
                    }

                    Section(header: Text(localazyKey: "All Sessions")) {                        
                        ForEach(sessions.dropFirst()) { session in
                            NavigationLink(destination: SessionDetailView(session: session)) {
                                Text(session.name)
                            }
                        }
                    }
                    Text(localazyKey: "Test")
                }
                .padding(.top, 200)
                

            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle(Text(localazyKey:"My Meditation"))
        }
    }
}

func loadSessionData() -> [Session] {
    let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
    print(languageCode)
    let fileName = "\(languageCode)" // Constructs the file name based on the locale    

    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        print("Failed to load data for locale \(languageCode)")
        return []
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Session].self, from: data)
    } catch {
        print("Error decoding session data for locale \(languageCode): \(error)")
        return []
    }
}
#Preview {
    ContentView()
}
