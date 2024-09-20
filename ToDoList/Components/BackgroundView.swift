import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color.tdoBackground1, Color.tdoBackground2], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
        
    }
}
#Preview {
    BackgroundView()
}
