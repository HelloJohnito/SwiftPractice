//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




// Variables 
var mutable: String = "this is a mutable variable."
let notMutable: String = "this is a non-mutable variable"

let int: Int = 2
let double: Double = 40.58
let float: Float = 40.50
let decimal: Decimal = 50.40

let bool: Bool = true

// Converting types
let convertToString = String(33)
let convertToNum = Int("33")
let convertToDouble = Double("33.4")

// Check type 
var string = "string"
string is String


// Array
var array = [2,3,4]
array[0]
array.append(3)
array.remove(at: 0)

var emptyArray  = [String]()

// Array with different variable types
var multipleTypes: Any = ["a", "b", true, "hi", 1]
var arbitraryArray = [Any]()


// Dictionary
var dictionary = ["a": 1.22, "b": 2.33]
dictionary["c"] = 3.33
dictionary.removeValue(forKey: "b")

var emptyDictionary = [String: Int]()





// Conditionals: If Statements
let userName = "john"
var password = "password"

if userName == "john" && password == "password" {
//    print("Hello \(userName), welcome")
} else if userName != "john" || password != "password" {
//    print("Invalid credentials")
} else {
//    print("Try Again")
}





// LOOPS
// While Loop

//var i = 0
//while i < 10 {
//    i += 1
//}

// For Loop 

var numbers = [1,2,3,7]

// for each
//for num in numbers {
//    print(num)
//}

// 0 through 3 inclusive
//for index in 0...3 {
//    print(index)
//}

// 0 through 3 exclusive
//for index in 0..<3 {
//    print(index)
//}

// index of arrays 
//for indexOfArray in 0..<numbers.count {
//    print(indexOfArray)
//}

//for (index, value) in numbers.enumerated() {
//    print(index)
//}





// CLASS AND OBJECTS
class Ghost {
    var name = "Boo"
    var strength = 10
    
    func scare() {
        print("BOOOOOO")
    }
    
    // return
    func isStrong() -> Bool {
        if strength > 5 {
            return true
        } else {
            return false
        }
    }
    
}

// Creating the object of the class
var ghost = Ghost() // instantiate
ghost.isStrong()





// OPTIONALS

var n: Int? // add a "?" to set it to nil
//print(n) 

let enteredNumber = "2"
let enteredNumberToInteger = Int(enteredNumber)

//var age = enteredNumberToInteger! * 7 // This needs to be unwrapped because enteredNumber can be nil.


if var age = enteredNumberToInteger {
    // if age can be set to enteredNumberToInteger (not nil) 
    // Do something here
}





