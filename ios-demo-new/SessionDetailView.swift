import SwiftUI

struct SessionDetailView: View {
    var session: Session

    var body: some View {
        VStack {
            Text(session.name)
                .font(.largeTitle)
                .padding()

            Text("Details about \(session.name).")
                .padding()

            Spacer()
        }
    }
}

#Preview {
    SessionDetailView(session: Session(
        id: "99",
        name: "Test",
        description: "Test"
    ))
}
