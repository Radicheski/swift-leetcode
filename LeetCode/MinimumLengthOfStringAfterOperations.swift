//
//  MinimumLengthOfStringAfterOperations.swift
//  https://leetcode.com/problems/minimum-length-of-string-after-operations/
//
//  Created by Erik Radicheski da Silva on 13/01/25.
//

import XCTest

final class MinimumLengthOfStringAfterOperations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumLength("abaacbcbb"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumLength("aa"), 2)
    }
    
}

private class Solution {
    func minimumLength(_ s: String) -> Int {
        var count = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        var answer = 0
        
        for (_, value) in count {
            answer += value.isMultiple(of: 2) ? 2 : 1
        }
        
        return answer
    }
}
