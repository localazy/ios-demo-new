
import SwiftUI

struct ContentView: View {
    private var sessions: [Session] {
        loadSessionData()
    }
    private var todaysSession: Session? {
        sessions.first
    }
    
    var body: some View {
        
        NavigationView {
            List {
                if let todaysSession = todaysSession {
                    Section(header: Text("Today's session")) {
                        NavigationLink(destination: SessionDetailView(session: todaysSession)) {
                            Text(todaysSession.name)
                        }
                    }
                } else {
                    Section(header: Text("Today's session")) {
                        Text("No session today")
                    }
                }
                
                Section(header: Text("All Sessions")) {
                    ForEach(sessions.dropFirst()) { session in
                        NavigationLink(destination: SessionDetailView(session: session)) {
                            Text(session.name)
                        }
                    }
                }
            }
            .navigationTitle("Meditation")
        }
    }
}

func loadSessionData() -> [Session] {
    guard let url = Bundle.main.url(forResource: "sessions", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return []
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Session].self, from: data)
    } catch {
        print("Error decoding session data: \(error)")
        return []
    }
}


#Preview {
    ContentView()
}
