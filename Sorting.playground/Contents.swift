//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let length = 9
var randomArray = [Int]()

while randomArray.count < length {
    randomArray.append(Int(arc4random_uniform(100)))
}

let bubbleSorter = BubbleSorter<Int>(initialArray:randomArray)

XCPCaptureValue("Initial Array", value: randomArray.description)
plotArrayInPlayground(randomArray, title: "Initial Graph")

let start = CACurrentMediaTime()

while(!bubbleSorter.doneSorting) {
    try bubbleSorter.iterate()
}

let end = CACurrentMediaTime()

plotArrayInPlayground(bubbleSorter.currentArray, title: "Final Graph")

XCPCaptureValue("Total number of iterations", value: bubbleSorter.stepArrays.count)

XCPCaptureValue("Time to execute", value: NSString(format: "%.03f seconds",end - start))
