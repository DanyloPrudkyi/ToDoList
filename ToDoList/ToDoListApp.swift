import SwiftUI

@main
struct ToDoListApp: App {
    
    //MARK: - Properties
    @AppStorage(darkMode) private var isDarkMode = true
    @StateObject var vm = TaskListViewModel()
    @StateObject var addTaskModel = AddTaskViewModel()
    @StateObject var editTaskModel = EditTaskViewModel()
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .environmentObject(addTaskModel)
                .environmentObject(editTaskModel)
                .preferredColorScheme(isDarkMode ? .dark: .light)
        }
    }
}
