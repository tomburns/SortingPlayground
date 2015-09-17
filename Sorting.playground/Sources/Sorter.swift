public protocol Sorter {
    typealias ItemType: Comparable
    
    var doneSorting: Bool { get }
    
    var currentArray: [ItemType] { get }
    
    var stepArrays: [[ItemType]] { get }
    
    func iterate() throws
}