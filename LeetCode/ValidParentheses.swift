//
//  ValidParentheses.swift
//  https://leetcode.com/problems/valid-parentheses/
//
//  Created by Erik Radicheski da Silva on 08/09/22.
//

import XCTest

class ValidParentheses: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertTrue(solution.isValid("()"))
        XCTAssertTrue(solution.isValid("()[]{}"))
        XCTAssertFalse(solution.isValid("(]"))
    }

}

private class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for character in s {
            if let lastParentheses = stack.last {
                if lastParentheses == "(" && character == ")" ||
                    lastParentheses == "{" && character == "}" ||
                    lastParentheses == "[" && character == "]" {
                    stack.removeLast()
                    continue
                } else if "({[".contains(character) {
                    stack.append(character)
                } else {
                    return false
                }
            } else {
                stack.append(character)
            }
        }
        
        return stack.isEmpty
    }
}
