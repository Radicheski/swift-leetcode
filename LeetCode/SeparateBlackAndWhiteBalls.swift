//
//  SeparateBlackAndWhiteBalls.swift
//  https://leetcode.com/problems/separate-black-and-white-balls/
//
//  Created by Erik Radicheski da Silva on 15/10/24.
//

import XCTest

final class SeparateBlackAndWhiteBalls: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumSteps("101"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumSteps("100"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumSteps("0111"), 0)
    }
    
}

private class Solution {
    func minimumSteps(_ s: String) -> Int {
        var count = 0
        var white = 0
        
        for (current, char) in s.enumerated() where char == "0" {
            count += current - white
            white += 1
        }
        
        return count
    }
}
