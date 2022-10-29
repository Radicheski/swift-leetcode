//
//  GenerateParentheses.swift
//  https://leetcode.com/problems/generate-parentheses/
//
//  Created by Erik Radicheski da Silva on 29/10/22.
//

import XCTest

final class GenerateParentheses: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.generateParenthesis(3)
        let expectedOutput = ["((()))", "(()())", "(())()", "()(())", "()()()"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }
    
    func testExampleB() {
        let output = solution.generateParenthesis(1)
        let expectedOutput = ["()"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }

}

private class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }
        guard n > 1 else { return ["()"] }
        
        var result = [String]()
        
        for i in 0 ..< n {
            let leftResult = generateParenthesis(i)
            let rightResult = generateParenthesis(n - i - 1)
            
            for left in leftResult {
                for right in rightResult {
                    result.append("(\(left))\(right)")
                }
            }
        }
        
        return result
    }
    
}
