//
//  ClearDigits.swift
//  https://leetcode.com/problems/clear-digits/
//
//  Created by Erik Radicheski da Silva on 10/02/25.
//

import XCTest

final class ClearDigits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.clearDigits("abc"), "abc")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.clearDigits("cb34"), "")
    }
    
}

private class Solution {
    func clearDigits(_ s: String) -> String {
        var answer = [Character]()
        
        for c in s {
            if c.isNumber {
                let _ = answer.popLast()
            } else {
                answer.append(c)
            }
        }
        
        return String(answer)
    }
}
