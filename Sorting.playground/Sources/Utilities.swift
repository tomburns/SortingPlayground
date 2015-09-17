import Foundation
import XCPlayground

import QuartzCore

public func plotArrayInPlayground<T>(arrayToPlot:Array<T>, title:String) {
    for currentValue in arrayToPlot {
        XCPCaptureValue(title, value: currentValue)
    }
}

public extension Sorter {
    func runWithTitle(title: String) {
        XCPCaptureValue("\(title) - Initial Array", value: self.currentArray.description)
        plotArrayInPlayground(self.currentArray, title: "\(title) - Initial Graph")
        
        let start = CACurrentMediaTime()
        
        while(!self.doneSorting) {
            try! self.iterate()
        }
        
        let end = CACurrentMediaTime()
        
        XCPCaptureValue("\(title) - Final Array", value: self.currentArray.description)
        plotArrayInPlayground(self.currentArray, title: "\(title) - Final Graph")
        
        XCPCaptureValue("\(title) - Total number of iterations", value: self.stepArrays.count)
        
        XCPCaptureValue("\(title) - Time to execute", value: NSString(format: "%.03f seconds",end - start))
    }
}