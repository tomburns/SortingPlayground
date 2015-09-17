//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let length = 10
var randomArray = [Int]()

while randomArray.count < length {
    randomArray.append(Int(arc4random_uniform(100)))
}

let bubbleSorter = BubbleSorter<Int>(initialArray:randomArray)

runSorter(bubbleSorter, title: "Int Bubble Sort")

//let bubbleStringSorter = BubbleSorter<String>(initialArray:["foo","bar","baz","cat","dog","pug"])
//
//runSorter(bubbleStringSorter, title: "String Bubble Sort")
