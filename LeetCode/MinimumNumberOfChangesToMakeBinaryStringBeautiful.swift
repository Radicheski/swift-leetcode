//
//  MinimumNumberOfChangesToMakeBinaryStringBeautiful.swift
//  https://leetcode.com/problems/minimum-number-of-changes-to-make-binary-string-beautiful/
//
//  Created by Erik Radicheski da Silva on 05/11/24.
//

import XCTest

final class MinimumNumberOfChangesToMakeBinaryStringBeautiful: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minChanges("1001"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minChanges("10"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minChanges("0000"), 0)
    }
    
}

private class Solution {
    func minChanges(_ s: String) -> Int {
        let s = Array(s)
        var answer = 0
        
        for i in stride(from: 0, to: s.endIndex, by: 2) {
            answer += (s[i] == s[i + 1]) ? 0 : 1
        }
        
        return answer
    }
}
