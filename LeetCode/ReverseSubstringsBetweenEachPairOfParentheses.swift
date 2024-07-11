//
//  ReverseSubstringsBetweenEachPairOfParentheses.swift
//  https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses/
//
//  Created by Erik Radicheski da Silva on 11/07/24.
//

import XCTest

final class ReverseSubstringsBetweenEachPairOfParentheses: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.reverseParentheses("(abcd)"), "dcba")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.reverseParentheses("(u(love)i)"), "iloveu")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.reverseParentheses("(ed(et(oc))el)"), "leetcode")
    }
    
}

private class Solution {
    func reverseParentheses(_ s: String) -> String {
        var stack = [Int]()
        var result = [Character]()
        
        for letter in s {
            if letter == "(" {
                stack.append(result.count)
            } else if letter == ")" {
                var start = stack.popLast()!
                var end = result.endIndex - 1
                
                while start < end {
                    let temp = result[start]
                    
                    result[start] = result[end]
                    result[end] = temp
                    
                    start += 1
                    end -= 1
                }
                
            } else {
                result.append(letter)
            }
        }
        
        return String(result)
    }
}
