
import Foundation
protocol TaskServiceProtocol {
    func addTask(task: String)
    func changeTaskStatus(task: TaskModel)
    func deleteTask(task: IndexSet)
    func updateTask(id: UUID, title: String)
}
final class TaskService: TaskServiceProtocol {
    func changeTaskStatus(task: TaskModel) {
        var tasks: Data = storage.data(forKey: tasksStr) ?? Data()
        guard var savedTasks = try? JSONDecoder().decode([TaskModel].self, from: tasks) else {return}
        guard let index = savedTasks.firstIndex(where: { $0.id == task.id }) else {return}
        savedTasks[index] = task
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(savedTasks)
            tasks.append(data)
            storage.setValue(tasks, forKey: tasksStr)
        } catch {
            print(error)
        }
    }
    
    func deleteTask(task: IndexSet) {
        var tasks: [Data] = storage.array(forKey: tasksStr) as? [Data] ?? []
            tasks.remove(atOffsets: task)
            storage.setValue(tasks, forKey: tasksStr)
    }
    
    func updateTask(id: UUID, title: String) {
        var tasks: Data = storage.data(forKey: tasksStr) ?? Data()
        guard var savedTasks = try? JSONDecoder().decode([TaskModel].self, from: tasks) else {return}
        guard let index = savedTasks.firstIndex(where: { $0.id == id }) else {return}
        savedTasks[index].title = title
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(savedTasks)
            tasks.append(data)
            storage.setValue(tasks, forKey: tasksStr)
        } catch {
            print(error)
        }
    }
    
    private let storage = UserDefaults.standard
    
    func addTask(task: String) {
        let newTask = TaskModel(title: task)
        var tasks: [Data] = storage.array(forKey: tasksStr) as? [Data] ?? []
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(newTask)
            tasks.append(data)
            storage.setValue(tasks, forKey: tasksStr)
        } catch {
            print(error)
        }
    }
}
