import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(TaskListViewModel())
        .preferredColorScheme(.dark)
}

