//
//  MinimumFlipsToMakeAORBEqualToC.swift
//  https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/
//
//  Created by Erik Radicheski da Silva on 07/06/23.
//

import XCTest

final class MinimumFlipsToMakeAORBEqualToC: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minFlips(2, 6, 5), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minFlips(4, 2, 7), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minFlips(1, 2, 3), 0)
    }

}

private class Solution {
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        guard a | b != c else { return 0 }
        
        var flipCount = 0
        
        for offset in 0 ... Int.bitWidth {
            if c & (1 << offset) == 0 {
                flipCount += a & (1 << offset) == 0 ? 0 : 1
                flipCount += b & (1 << offset) == 0 ? 0 : 1
            } else {
                flipCount += (a | b) & (1 << offset) == 0 ? 1 : 0
            }
        }
        
        return flipCount
    }
}
