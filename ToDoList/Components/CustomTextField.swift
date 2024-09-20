import SwiftUI

struct CustomTextField: View {
    //MARK: - Properties
    @EnvironmentObject var editTaskModel: EditTaskViewModel
    let placeholder: String
    
    //MARK: - Body
    var body: some View {
        TextField(placeholder, text: $editTaskModel.newTask)
            .font(.headline)
            .padding()
            .background(.toDoPrimary.opacity(twoTenths))
            .cornerRadius(CGFloat(ten))
    }
}
#Preview {
    CustomTextField(placeholder: enterNewTask)
        .environmentObject(EditTaskViewModel())
        .preferredColorScheme(.dark)
}
