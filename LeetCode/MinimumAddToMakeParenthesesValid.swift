//
//  MinimumAddToMakeParenthesesValid.swift
//  https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/
//
//  Created by Erik Radicheski da Silva on 09/10/24.
//

import XCTest

final class MinimumAddToMakeParenthesesValid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minAddToMakeValid("())"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minAddToMakeValid("((("), 3)
    }
    
}

private class Solution {
    func minAddToMakeValid(_ s: String) -> Int {
        var stack = [Character]()
        
        for c in s {
            if c == "(" {
                stack.append(c)
            } else {
                if let last = stack.last {
                    if last == c {
                        stack.append(c)
                    } else {
                        let _ = stack.popLast()
                    }
                } else {
                    stack.append(c)
                }
            }
        }
        
        return stack.count
    }
}
