
import Foundation
struct TaskModel: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
