import Foundation

protocol Repository {
    associatedtype Element
    
    func getAll() -> [Element]
    func getBy(identifier: String) -> Element?
}
