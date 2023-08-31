//
//  MinimumNumberOfTapsToOpenToWaterAGarden.swift
//  https://leetcode.com/problems/minimum-number-of-taps-to-open-to-water-a-garden/
//
//  Created by Erik Radicheski da Silva on 31/08/23.
//

import XCTest

final class MinimumNumberOfTapsToOpenToWaterAGarden: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minTaps(5, [3, 4, 1, 1, 0, 0]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minTaps(3, [0, 0, 0, 0]), -1)
    }

}

private class Solution {
    
    private let infinity = 1 << 31
    private let solutionNotFound = -1
    
    func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
        var dp = Array(repeating: infinity, count: n + 1)
        dp[0] = 0
        
        for (i, range) in ranges.enumerated() {
            let start = max(0, i - range)
            let end = min(n, i + range)
            
            for j in start ... end {
                dp[end] = min(dp[end], dp[j] + 1)
            }
        }
        
        return dp[n] == infinity ? solutionNotFound : dp[n]
    }
}
