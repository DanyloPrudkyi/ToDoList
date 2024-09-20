
import SwiftUI

struct EditTaskView: View {
    //MARK: - Properties
    @EnvironmentObject var editTaskModel: EditTaskViewModel
    @Environment (\.dismiss) private var dismiss
    var task: TaskModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            
            HStack(alignment: .center) {
                Text(editTask)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .topLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text(cancel)
                                .frame(width: CGFloat(sixtyFour))
                                .foregroundStyle(Color.tdoAccent)
                        }
                    }
                    .padding(.vertical)
            }
            //MARK: - TextField
            CustomTextField(placeholder: editTask)
            
            //MARK: - Save button
            CustomButton(titleButton: save) {
                editTaskModel.updateTask(id: task.id, title: editTaskModel.newTask)
            }
            Spacer()
        }
        .padding()
        .background(BackgroundView())
    }
}
#Preview {
    EditTaskView(task: TaskModel(title: titleOne))
        .environmentObject(EditTaskViewModel())
        .preferredColorScheme(.dark)
}
