//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let length = 6
var randomArray = [Int]()

while randomArray.count < length {
    randomArray.append(Int(arc4random_uniform(100)))
}

let bubbleSorter = BubbleSorter<Int>(initialArray:randomArray)

XCPCaptureValue("Initial Array", value: randomArray.description)
plotArrayInPlayground(randomArray, title: "Initial Graph")

while(!bubbleSorter.doneSorting) {
    try bubbleSorter.iterate()
    
    XCPCaptureValue("Array \(bubbleSorter.stepArrays.count)", value: bubbleSorter.currentArray.description)
    plotArrayInPlayground(bubbleSorter.currentArray, title: "Graph \(bubbleSorter.stepArrays.count)")

}

XCPCaptureValue("Final Array", value: randomArray.description)
plotArrayInPlayground(bubbleSorter.currentArray, title: "Final Graph")