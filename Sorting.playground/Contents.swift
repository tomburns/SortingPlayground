//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let length = 100
var randomArray = [Int]()

while randomArray.count < length {
    randomArray.append(Int(arc4random_uniform(100)))
}

let bubbleSorter = BubbleSorter<Int>(initialArray:randomArray)

bubbleSorter.runWithTitle("Int Bubble Sort")

let insertionSorter = InsertionSorter<Int>(initialArray:randomArray)

insertionSorter.runWithTitle("Int Insertion Sort")

//let bubbleStringSorter = BubbleSorter<String>(initialArray:["foo","bar","baz","cat","dog","pug"])
//
//runSorter(bubbleStringSorter, title: "String Bubble Sort")
