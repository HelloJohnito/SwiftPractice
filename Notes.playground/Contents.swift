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









