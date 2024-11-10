//
//  MinimumArrayEnd.swift
//  https://leetcode.com/problems/minimum-array-end/
//
//  Created by Erik Radicheski da Silva on 10/11/24.
//

import XCTest

final class MinimumArrayEnd: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minEnd(3, 4), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minEnd(2, 7), 15)
    }
    
}

private class Solution {
    func minEnd(_ n: Int, _ x: Int) -> Int {
        var lastNum = x

        for _ in 0 ..< n - 1 {
            lastNum += 1
            lastNum |= x
        }

        return lastNum
    }
}
