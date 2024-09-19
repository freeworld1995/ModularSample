import Foundation

public protocol StorageAPI {
    associatedtype Model
    
    func get() -> [Model]
    func delete(_ model: Model)
    func insert(_ model: Model)
}
