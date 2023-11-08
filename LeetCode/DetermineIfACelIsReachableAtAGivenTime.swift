//
//  DetermineIfACelIsReachableAtAGivenTime.swift
//  https://leetcode.com/problems/determine-if-a-cell-is-reachable-at-a-given-time/
//
//  Created by Erik Radicheski da Silva on 08/11/23.
//

import XCTest

final class DetermineIfACelIsReachableAtAGivenTime: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isReachableAtTime(2, 4, 7, 7, 6))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isReachableAtTime(3, 1, 7, 3, 3))
    }

}

private class Solution {
    func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        let dx = abs(fx - sx)
        let dy = abs(fy - sy)
        
        if dx == 0 && dy == 0 && t == 1 { return false }
        
        return max(dx, dy) <= t
    }
}
