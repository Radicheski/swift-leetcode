//
//  FlipStringToMonotoneIncreasing.swift
//  https://leetcode.com/problems/flip-string-to-monotone-increasing/
//
//  Created by Erik Radicheski da Silva on 17/01/23.
//

import XCTest

final class FlipStringToMonotoneIncreasing: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minFlipsMonoIncr("00110"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minFlipsMonoIncr("010110"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minFlipsMonoIncr("00011000"), 2)
    }
}

private class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var result = 0
        var flippedCount = 0
        let s = Array(s)
        
        for index in s.indices {
            if s[index] == "0" {
                result = min(flippedCount, result + 1)
            } else {
                flippedCount += 1
            }
        }
        
        return result
    }
}
