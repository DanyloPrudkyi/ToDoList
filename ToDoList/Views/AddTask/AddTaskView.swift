
import SwiftUI
struct AddTaskView: View {
    //MARK: - Properties
    @Environment (\.dismiss) private var dismiss
    @EnvironmentObject var addTaskModel: AddTaskViewModel
    
    //MARK: - Body
    var body: some View {
        ZStack {
            //MARK: - Background
            BackgroundView()
            
            VStack {
                CustomTextField(placeholder: enterNewTask)
                
                //MARK: - Add Task Button
                CustomButton(titleButton: addTask) {
                    addTaskModel.addTask(task: addTaskModel.newTask)
                }
                
                Spacer()
            }
            .padding()
        }
        
        //MARK: - Navigation Bar
        .navigationTitle(addTask)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                //MARK: - Back Button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: chevronLeft)
                        .font(.headline)
                        .foregroundStyle(Color.tdoAccent)
                }
            }
        }
        .onAppear {
            addTaskModel.newTask = empty
        }
    }
}
#Preview {
    AddTaskView()
        .environmentObject(AddTaskViewModel())
        .preferredColorScheme(.dark)
}
