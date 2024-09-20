
import SwiftUI
struct TaskRow: View {
    
    //MARK: - Properties
    var model: TaskModel
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text(model.title)
                .foregroundStyle(Color.tdoPrimary.opacity(model.isCompleted ? halfOne : Double(onee)))
            
            Spacer()
            //MARK: - Button
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ? checkmark : square )
                    .foregroundStyle(Color.tdoAccent)
            }
            .buttonStyle(.borderless)
        }
        .font(.headline)
        .padding()
        .background(Color.tdoPrimary.opacity(model.isCompleted ? oneTenths : zeroTwentyFive))
        .cornerRadius(CGFloat(ten))
        .listRowInsets(EdgeInsets(top: CGFloat(zeroo), leading: CGFloat(sixTeen), bottom: CGFloat(zeroo), trailing: CGFloat(sixTeen)))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .padding(.vertical, CGFloat(six))
    }
}
#Preview {
    List {
        TaskRow(model: TaskModel(title: testTaskOne, isCompleted: true)) {}
        TaskRow(model: TaskModel(title: testTaskTwo, isCompleted: false)) {}
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)
}
