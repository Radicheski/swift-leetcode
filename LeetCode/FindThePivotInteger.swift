//
//  FindThePivotInteger.swift
//  https://leetcode.com/problems/find-the-pivot-integer/
//
//  Created by Erik Radicheski da Silva on 13/03/24.
//

import XCTest

final class FindThePivotInteger: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.pivotInteger(8), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.pivotInteger(1), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.pivotInteger(4), -1)
    }
    
}

private class Solution {
    func pivotInteger(_ n: Int) -> Int {
        var sufix = (1 + n) * n / 2
        var prefix = 0

        for pivot in 1 ... n {
            prefix += pivot

            if prefix == sufix { return pivot }

            guard prefix < sufix else { break }

            sufix -= pivot
        }

        return -1
    }
}
