//
//  MaximumNestingDepthOfTheParentheses.swift
//  https://leetcode.com/problems/maximum-nesting-depth-of-the-parentheses/
//
//  Created by Erik Radicheski da Silva on 04/04/24.
//

import XCTest

final class MaximumNestingDepthOfTheParentheses: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDepth("(1+(2*3)+((8)/4))+1"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDepth("(1)+((2))+(((3)))"), 3)
    }
    
}

private class Solution {
    func maxDepth(_ s: String) -> Int {
        var depth = 0
        var maxDepth = 0
        
        for char in s {
            if char == "("  {
                depth += 1
                maxDepth = max(maxDepth, depth)
            } else if char == ")" {
                depth -= 1
            }
        }
        
        return maxDepth
    }
}
