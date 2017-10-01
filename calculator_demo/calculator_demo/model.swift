//
//  File.swift
//  calculator_demo
//
//  Created by John  Ito lee on 9/24/17.
//  Copyright © 2017 Johnito. All rights reserved.
//

import Foundation

//func multiply(op1: Double, op2: Double) -> Double {
//    return op1 * op2
//}

// closure version
//{(op1: Double, op2: Double) -> Double in return op1 * op2 } 


class CalculatorModel {
    
    private var accumulator = 0.0
    
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    
    private var operations: Dictionary<String, Operations> = [
        "π" : Operations.Constant(Double.pi),
        "e" : Operations.Constant(M_E),
        "±" : Operations.UnaryOperation({-$0}),
        "√" : Operations.UnaryOperation(sqrt),
        "cos" : Operations.UnaryOperation(cos),
        "*" : Operations.BinaryOperaition({$0 * $1}), // closures
        "/" : Operations.BinaryOperaition({$0 / $1}),
        "+" : Operations.BinaryOperaition({$0 + $1}),
        "-" : Operations.BinaryOperaition({$0 - $1}),
        "=" : Operations.Equals
    ]
    
    
    private enum Operations {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperaition((Double, Double) -> Double)
        case Equals
    }
    
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperaition(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    
    var result: Double {
        get{
            return accumulator
        }
    }
}
