
import Foundation

final class TaskListViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = empty
    @Published var taskService = TaskService()
    @Published var selectedTask: TaskModel?
    
    //MARK: - Methods
    func changeTaskStatus(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index].isCompleted.toggle()
            taskService.changeTaskStatus(task: tasks[index])
        }
    }
    func deleteTask(task: IndexSet) {
        tasks.remove(atOffsets: task)
        taskService.deleteTask(task: task)
    }
}
