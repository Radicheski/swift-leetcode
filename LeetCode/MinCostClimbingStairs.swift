//
//  MinCostClimbingStairs.swift
//  https://leetcode.com/problems/min-cost-climbing-stairs/
//
//  Created by Erik Radicheski da Silva on 26/08/22.
//

import XCTest

class MinCostClimbingStairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCostClimbingStairs([10, 15, 20]), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]), 6)
    }

}

private class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count)
        
        var step = cost.count - 1
        dp[step] = cost[step]
        
        step -= 1
        dp[step] = cost[step]
        
        while step > 0 {
            step -= 1
            dp[step] = cost[step] + min(dp[step + 1], dp[step + 2])
        }
        
        return min(dp[0], dp[1])
    }
}
