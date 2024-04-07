//
//  ValidParenthesisString.swift
//  https://leetcode.com/problems/valid-parenthesis-string/
//
//  Created by Erik Radicheski da Silva on 07/04/24.
//

import XCTest

final class ValidParenthesisString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkValidString("()"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.checkValidString("(*)"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.checkValidString("(*))"))
    }
    
}

private class Solution {
    func checkValidString(_ s: String) -> Bool {
        var wildcard = [Int]()
        var opened = [Int]()
        
        for (i, char) in s.enumerated() {
            if char == "*" {
                wildcard.append(i)
            } else if char == "(" {
                opened.append(i)
            } else if char == ")" {
                if opened.isEmpty == false {
                    let _ = opened.popLast()
                } else if wildcard.isEmpty == false {
                    let _ = wildcard.popLast()
                } else {
                    return false
                }
            }
        }
        
        while opened.isEmpty == false && wildcard.isEmpty == false {
            if let open = opened.popLast(), let wild = wildcard.popLast(),
               open > wild {
                return false
            }
        }
        
        return opened.isEmpty
    }
}
