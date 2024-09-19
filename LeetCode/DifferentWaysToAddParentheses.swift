//
//  DifferentWaysToAddParentheses.swift
//  https://leetcode.com/problems/different-ways-to-add-parentheses/
//
//  Created by Erik Radicheski da Silva on 19/09/24.
//

import XCTest

final class DifferentWaysToAddParentheses: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.diffWaysToCompute("2-1-1"), [0, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.diffWaysToCompute("2*3-4*5"), [-34, -14, -10, -10, 10])
    }
    
}

private class Solution {
    func diffWaysToCompute(_ expression: String) -> [Int] {
        guard expression.isEmpty == false else { return [] }
        
        if expression.count == 1, let result = Int(expression) {
            return [result]
        }
        
        if expression.count == 2 && expression.first?.isHexDigit == true,
           let result = Int(expression) {
            return [result]
        }
        
        let length = expression.count
        var results = [Int]()
        
        for (i, char) in expression.enumerated() {
            if char.isHexDigit { continue }
            
            let left = diffWaysToCompute(String(expression.prefix(i)))
            let right = diffWaysToCompute(String(expression.suffix(length - i - 1)))
            
            for leftValue in left {
                for rightValue in right {
                    var result = leftValue
                    
                    switch char {
                    case "+": result += rightValue
                    case "-": result -= rightValue
                    case "*": result *= rightValue
                    default: continue
                    }
                    
                    results.append(result)
                }
            }
        }
        
        return results
    }
}
