
import SwiftUI

struct TaskListView: View {
    
    //MARK: - Properties
    @EnvironmentObject var taskListViewModel: TaskListViewModel
    @State private var isEditViewPresented = false
    
    //MARK: - body
    var body: some View {
        NavigationStack {
            ZStack {
                
                BackgroundView()
                VStack {
                    if taskListViewModel.tasks.isEmpty {
                        //MARK: - Empty List
                        NoTasksView()
                    } else {
                        
                        List {
                            ForEach(taskListViewModel.tasks) { task in
                                TaskRow(model: task) {
                                    taskListViewModel.changeTaskStatus(task: task)
                                }
                                .onTapGesture {
                                    taskListViewModel.selectedTask = task
                                    isEditViewPresented = true
                                }
                                
                            }
                            //MARK: - Delete Task
                            .onDelete(perform: taskListViewModel.deleteTask)
                            .sheet(isPresented: $isEditViewPresented, content: {
                                
                                if let taskToEdit = taskListViewModel.selectedTask {
                                    EditTaskView(task: taskToEdit)
                                }
                            })
                        }
                        .listStyle(.plain)
                    }
                    
                }
            }
            .navigationTitle(todoList)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    //MARK: - Navigation
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: plus)
                            .foregroundStyle(Color.tdoPrimary)
                    }
                }
            }
            
            
        }
    }
}
#Preview {
    TaskListView()
        .environmentObject(TaskListViewModel())
        .preferredColorScheme(.dark)
}
