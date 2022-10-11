//
//  MinimumRemoveToMakeValidParentheses.swift
//  https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses/
//
//  Created by Erik Radicheski da Silva on 11/10/22.
//

import XCTest

final class MinimumRemoveToMakeValidParentheses: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minRemoveToMakeValid("lee(t(c)o)de)"), "lee(t(c)o)de")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minRemoveToMakeValid("a)b(c)d"), "ab(c)d")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minRemoveToMakeValid("))(("), "")
    }

}

private class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [(Int, Character)]()
        var string = Array(s)
        
        var index = 0
        
        while index < string.count {
            let character = string[index]
            
            if character == "(" {
                stack.append((index, character))
                index += 1
                continue
            }
            
            if character == ")" {
                if let last = stack.last,
                   last.1 == "(" {
                    let _ = stack.removeLast()
                    index += 1
                    continue
                } else {
                    string.remove(at: index)
                    continue
                }
            }
            
            index += 1
        }
        
        for (index, _) in stack.reversed() {
            string.remove(at: index)
        }
        
        return String(string)
    }
}
