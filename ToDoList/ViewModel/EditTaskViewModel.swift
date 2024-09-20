

import Foundation
final class EditTaskViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var tasks: [TaskModel] = []
    @Published var newTask = empty
    @Published var selectedTask: TaskModel?
    @Published var taskService = TaskService()
    
    //MARK: - Methods
    func updateTask(id: UUID, title: String) {
        if let index = tasks.firstIndex(where: {$0.id == id}) {
            tasks[index].title = title
            taskService.updateTask(id: id, title: title)
        }
    }
}
