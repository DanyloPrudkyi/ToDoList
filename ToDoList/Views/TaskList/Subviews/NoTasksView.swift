
import SwiftUI

struct NoTasksView: View {
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            Spacer()
            
            //MARK: - Text
            Text(noTasksMessage)
                .font(.title)
                .foregroundStyle(Color.tdoPrimary)
                .opacity(halfOne)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            //MARK: - Add View Button
            NavigationLink(destination: AddTaskView()) {
                ZStack {
                    Circle()
                        .frame(width: CGFloat(Onehundred))
                        .foregroundStyle(Color.tdoPrimary)
                        .opacity(halfOne)
                    Image(systemName: plus)
                        .foregroundStyle(Color.tdoBackground2)
                        .font(.largeTitle)
                }
            }
            .padding(.bottom)
        }
    }
}
#Preview {
    NoTasksView()
        .environmentObject(TaskListViewModel())
        .preferredColorScheme(.dark)
}
