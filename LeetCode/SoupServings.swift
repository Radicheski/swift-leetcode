//
//  SoupServings.swift
//  https://leetcode.com/problems/soup-servings/
//
//  Created by Erik Radicheski da Silva on 29/07/23.
//

import XCTest

final class SoupServings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.soupServings(50), 0.625, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.soupServings(100), 0.71875, accuracy: 1e-5)
    }
    
}

private class Solution {
    func soupServings(_ n: Int) -> Double {
        guard n > 0 else { return 0.5 }
        
        let m = n / 25 + (n.isMultiple(of: 25) ? 0 : 1)
        var dp = [Int: [Int: Double]]()
        dp[0, default: [:]][0] = 0.5
        
        for i in 1 ... m {
            dp[0, default: [:]][i] = 1
            dp[i, default: [:]][0] = 0
            
            for j in 1 ... i {
                dp[j, default: [:]][i] = calculate(j, i, dp)
                dp[i, default: [:]][j] = calculate(i, j, dp)
            }
            
            if let probability = dp[i]?[i],
               probability > 1 - 1e-5 {
                return 1
            }
        }
        
        return dp[m]![m]!
    }
    
    private func calculate(_ i: Int, _ j: Int, _ dp: [Int: [Int: Double]]) -> Double {
        let eventA = dp[max(0, i - 4)]![j]!
        let eventB = dp[max(0, i - 3)]![j - 1]!
        let eventC = dp[max(0, i - 2)]![max(0, j - 2)]!
        let eventD = dp[i - 1]![max(0, j - 3)]!
        
        return 0.25 * (eventA + eventB + eventC + eventD)
             
    }
}
