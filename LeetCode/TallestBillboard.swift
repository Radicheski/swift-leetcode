//
//  TallestBillboard.swift
//  https://leetcode.com/problems/tallest-billboard/
//
//  Created by Erik Radicheski da Silva on 24/06/23.
//

import XCTest

final class TallestBillboard: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.tallestBillboard([1, 2, 3, 6]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.tallestBillboard([1, 2, 3, 4, 5, 6]), 10)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.tallestBillboard([1, 2]), 0)
    }

}

private class Solution {
    func tallestBillboard(_ rods: [Int]) -> Int {
        var dp = [0: 0]
        
        for r in rods {
            var newDp = dp
            
            for (diff, taller) in dp {
                let shorter = taller - diff
                var newTaller = newDp[diff + r, default: 0]
                newDp[diff + r] = max(newTaller, taller + r)
                
                let newDiff = abs(shorter + r - taller)
                newTaller = max(shorter + r, taller)
                newDp[newDiff] = max(newTaller, newDp[newDiff, default: 0])
            }
            
            dp = newDp
        }
        
        return dp[0, default: 0]
    }
}
