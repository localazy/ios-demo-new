import SwiftUI

struct SessionDetailView: View {
    var session: Session

    var body: some View {
        VStack {
            Text(session.name)
                .font(.largeTitle)
                .padding()

            Text(session.description)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
    }
}

#Preview {
    SessionDetailView(session: Session(
        id: "99",
        name: "Test",
        description: "Test description"
    ))
}
