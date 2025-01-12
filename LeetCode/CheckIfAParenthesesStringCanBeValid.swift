//
//  CheckIfAParenthesesStringCanBeValid.swift
//  https://leetcode.com/problems/check-if-a-parentheses-string-can-be-valid/
//
//  Created by Erik Radicheski da Silva on 12/01/25.
//

import XCTest

final class CheckIfAParenthesesStringCanBeValid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canBeValid("))()))", "010100"))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canBeValid("()()", "0000"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canBeValid(")", "0"))
    }
    
}

private class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        let s = Array(s)
        let locked = locked.map { $0 == "1" }
        
        guard s.count.isMultiple(of: 2) else { return false }
        
        var openBrackets = [Int]()
        var unlocked = [Int]()
        
        for i in s.indices {
            if locked[i] == false {
                unlocked.append(i)
            } else if s[i] == "(" {
                openBrackets.append(i)
            } else if s[i] == ")" {
                if openBrackets.isEmpty == false {
                    let _ = openBrackets.popLast()
                } else if unlocked.isEmpty == false {
                    let _ = unlocked.popLast()
                } else {
                    return false
                }
            }
        }
        
        while let lastLocked = openBrackets.last, let lastUnlocked = unlocked.last {
            guard lastLocked < lastUnlocked else { break }
            
            let _ = openBrackets.popLast()
            let _ = unlocked.popLast()
        }
        
        return openBrackets.isEmpty
    }
}
