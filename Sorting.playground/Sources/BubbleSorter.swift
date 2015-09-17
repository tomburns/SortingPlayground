public class BubbleSorter<T: Comparable>: Sorter {
    
    public typealias ItemType = T
    
    public let initialArray: [ItemType]
    
    public var stepArrays = [[ItemType]]()
    
    private var currentIndex: Int
    private var currentMaxIndex: Int
    
    public var doneSorting: Bool {
        get {
            guard let lastStep = stepArrays.last else {
                return false
            }
            
            let nextStep = step(lastStep)
            
            return (nextStep == step(nextStep)) && currentIndex == 0 && currentMaxIndex == 0
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
        currentIndex = 0
        currentMaxIndex = initialArray.count - 1
        
        stepArrays.append(initialArray)
    }
    
    public func iterate() throws -> [ItemType] {
        guard let lastStep = stepArrays.last else {
            throw SortErrors.InvalidState
        }
        
        let stepArray = step(lastStep)
        
        if (currentIndex < currentMaxIndex - 1) {
            currentIndex += 1
        } else {
            currentIndex = 0
            currentMaxIndex -= 1
        }
        
        stepArrays.append(stepArray)
        
        return stepArray
    }
    
    private func step(array:[ItemType]) -> [ItemType] {
        var newArray = array
        
        if newArray[currentIndex] > newArray[currentIndex+1] {
            let temp = newArray[currentIndex]
            newArray[currentIndex] = array[currentIndex+1]
            newArray[currentIndex+1] = temp
        }
        
        print(newArray)
        
        return newArray
    }
}
