public class InsertionSorter<T: Comparable>: Sorter {
    
    public typealias ItemType = T
    
    public let initialArray: [ItemType]
    
    public var stepArrays = [[ItemType]]()

    private var insertCursor = 1
    private var currentMaxInsertCursor = 1
    
    private var insertArray: [ItemType]
    
    public var doneSorting: Bool {
        get {
            return insertCursor <= 1 && currentMaxInsertCursor >= initialArray.count - 1
        }
    }
    
    public var currentArray: [ItemType] {
        get {
            guard let lastStep = stepArrays.last else {
                return []
            }
            
            return lastStep
        }
    }
    
    public init(initialArray: [ItemType]) {
        self.initialArray = initialArray
        
        self.insertArray = initialArray
        
        stepArrays.append(self.insertArray)
    }
    
    public func iterate() throws {
        guard let lastStep = stepArrays.last else {
            throw SortErrors.InvalidState
        }
        
        if insertCursor == 0 {
            insertCursor = currentMaxInsertCursor + 1
            currentMaxInsertCursor = insertCursor
        } else {
            let nextStep = stepWithArray(lastStep, insertCursor: self.insertCursor)
            stepArrays.append(nextStep)
            insertCursor -= 1
        }
    
    }
    
    private func stepWithArray(array: [ItemType], insertCursor: Int) -> [ItemType] {
        var resultArray = array
        
        if (array[insertCursor] < array[insertCursor-1]) {
            let temp = array[insertCursor]

            resultArray[insertCursor] = array[insertCursor-1]
            resultArray[insertCursor-1] = temp
            
        }
        
        return resultArray
    }
}
