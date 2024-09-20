import SwiftUI

struct CustomButton: View {
    //MARK: - Properties
    @Environment (\.dismiss) private var dismiss
    let titleButton: String
    let action: () -> ()
    
    //MARK: - Body
    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(titleButton)
                .font(.headline)
                .padding()
                .foregroundStyle(Color.tdoBackground1)
                .frame(maxWidth: .infinity)
                .background(Color.tdoAccent)
                .cornerRadius(CGFloat(ten))
        }
    }
}
#Preview {
    CustomButton(titleButton: "Add task") {}
        .environmentObject(TaskListViewModel())
        .preferredColorScheme(.dark)
}
