//
//  BasicCalculator2.swift
//  https://leetcode.com/problems/basic-calculator-ii/
//
//  Created by Erik Radicheski da Silva on 26/11/22.
//

import XCTest

final class BasicCalculator2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.calculate("3+2*2"), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.calculate(" 3/2 "), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.calculate(" 3+5 / 2 "), 5)
    }

}

private class Solution {
    
    func calculate(_ s: String) -> Int {
        let s = Array(s)
        
        var stack = [Int]()
        var currentNumber = 0
        var operation: Character = "+"
        
        for (index, character) in s.enumerated() {
            if let number = Int("\(character)") {
                currentNumber = (currentNumber * 10) + number
            }
            if character.isNumber == false && character.isWhitespace == false || index == s.count - 1 {
                if operation == "-" {
                    stack.append(-currentNumber)
                } else if operation == "+" {
                    stack.append(currentNumber)
                } else if operation == "*" {
                    let number = stack.removeLast()
                    stack.append(number * currentNumber)
                } else if operation == "/" {
                    let number = stack.removeLast()
                    stack.append(number / currentNumber)
                }
                
                operation = character
                currentNumber = 0
            }
        }
        
        return stack.reduce(into: 0, +=)
    }
}
