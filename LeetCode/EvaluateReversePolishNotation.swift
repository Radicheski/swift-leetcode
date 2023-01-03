//
//  EvaluateReversePolishNotation.swift
//  https://leetcode.com/problems/evaluate-reverse-polish-notation/
//
//  Created by Erik Radicheski da Silva on 03/01/23.
//

import XCTest

final class EvaluateReversePolishNotation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.evalRPN(["2", "1", "+", "3", "*"]), 9)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.evalRPN(["4", "13", "5", "/", "+"]), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]), 22)
    }
    
}

private class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            if let number = Int(token) {
                stack.append(number)
            } else {
                let rhs = stack.removeLast()
                let lhs = stack.removeLast()
                switch token {
                case "+":
                    stack.append(lhs + rhs)
                case "-":
                    stack.append(lhs - rhs)
                case "*":
                    stack.append(lhs * rhs)
                case "/":
                    stack.append(lhs / rhs)
                default:
                    fatalError()
                }
            }
        }
        
        return stack[0]
    }
}
