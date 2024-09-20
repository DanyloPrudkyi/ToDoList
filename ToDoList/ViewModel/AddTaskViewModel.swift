
import Foundation
final class AddTaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var newTask = empty
    @Published var selectedTask: TaskModel?
    
    private let taskService: TaskServiceProtocol = TaskService()
    //MARK: - Methods
    func addTask(task: String) {
        taskService.addTask(task: task)
    }
}

