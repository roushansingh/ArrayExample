//
//  ViewController.swift
//  ArrayExample
//
//  Created by Chetu on 12/06/18.
//  Copyright © 2018 Chetu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Array")
        
        let arr = [1,2,3,4,5,6,7,8]
        
        print(rotateArrayBy(arr: arr, rotateElementBy: 5))
        
        var firstValue = "One"
        var secondValue = "Two"
        swapTwoValue(a: &firstValue, b: &secondValue)
        print("first = \(firstValue) , second = \(secondValue)")
        
        //
        var stackOfString = Stack<String>()
        stackOfString.push(item: "One")
        stackOfString.push(item: "Two")
        stackOfString.push(item: "Three")
        stackOfString.push(item: "Four")
        
        print(stackOfString)
        print(stackOfString.pop())
        
        if let topItem = stackOfString.topItem {
            
            print("Top item = \(topItem)")
        }
//        let array = [1, 2, 3]
//        print(array[7])
        
        
        DispatchQueue.global(qos: .background).async {
            
            
        }
        
        let numberArr = [1,2,3,4]
        //let mapped = numberArr.map{$0 + 10}
        let mapped = numberArr.map{Array(repeating: $0, count: 3) }
        print("Mapped array = \(mapped)")
        let scores = [[1,2,3], [5,10], [1,3,5]]
        let allScores = scores.flatMap{ $0.filter{ $0 > 3 } }
        print("FlatMapped array = \(allScores)")
        
        let names: [String?] = ["Tom", nil, "Peter", nil, "Harry"]
        let counts = names.compactMap({ $0 })
        print("compactmap  = \(counts)")
        
        let bookAmount = ["harrypotter":100.0, "junglebook":100.0]
        let returnFromMap = bookAmount.map{ (key,value) in
            return key.capitalized
        }
        print("returnFromMap  = \(returnFromMap)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func leftRotateByOne(arr : [Int] ,size : Int) -> [Int]{
        
        var tempArr = arr
        let tempValue = tempArr[0]
        for count in 0..<size - 1 {
            
            tempArr[count] = tempArr[count + 1]
        }
        
        tempArr[size - 1] = tempValue
        
        return tempArr
    }
    
    func rotateArrayBy(arr : [Int] ,rotateElementBy : Int) -> [Int] {
        
        var rotatedArray = arr
        for _ in 0..<rotateElementBy {
            
            rotatedArray = leftRotateByOne(arr: rotatedArray, size: rotatedArray.count)
        }
        
        return rotatedArray
    }
    
    func swapTwoValue<T>(a : inout T , b : inout T) {
        
        let temp = a
        a = b
        b = temp
    }
    
    
}

struct Stack<Element> {
    
    var items = [Element]()
    
    mutating func push(item : Element) {
        
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
}

