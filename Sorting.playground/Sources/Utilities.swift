import Foundation
import XCPlayground

import QuartzCore

public func plotArrayInPlayground<T>(arrayToPlot:Array<T>, title:String) {
    for currentValue in arrayToPlot {
        XCPCaptureValue(title, value: currentValue)
    }
}

public func runSorter<SorterType: Sorter>(sorter: SorterType, title: String) {
    XCPCaptureValue("\(title) - Initial Array", value: sorter.currentArray.description)
    plotArrayInPlayground(sorter.currentArray, title: "\(title) - Initial Graph")
    
    let start = CACurrentMediaTime()
    
    while(!sorter.doneSorting) {
        try! sorter.iterate()
    }
    
    let end = CACurrentMediaTime()
    
    XCPCaptureValue("\(title) - Final Array", value: sorter.currentArray.description)
    plotArrayInPlayground(sorter.currentArray, title: "\(title) - Final Graph")
    
    XCPCaptureValue("\(title) - Total number of iterations", value: sorter.stepArrays.count)
    
    XCPCaptureValue("\(title) - Time to execute", value: NSString(format: "%.03f seconds",end - start))
}