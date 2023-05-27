//
//  StoneGame3.swift
//  https://leetcode.com/problems/stone-game-iii/
//
//  Created by Erik Radicheski da Silva on 27/05/23.
//

import XCTest

final class StoneGame3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.stoneGameIII([1, 2, 3, 7]), "Bob")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.stoneGameIII([1, 2, 3, -9]), "Alice")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.stoneGameIII([1, 2, 3, 6]), "Tie")
    }
    
}

private class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        var dp: [Int] = Array(repeating: 0, count: stoneValue.count + 1)
        
        for i in (0 ..< stoneValue.endIndex).reversed() {
            dp[i] = stoneValue[i] - dp[i + 1]
            
            if stoneValue.indices.contains(i + 1) {
                dp[i] = max(dp[i], stoneValue[i] + stoneValue[i + 1] - dp[i + 2])
            }
            
            if stoneValue.indices.contains(i + 2) {
                dp[i] = max(dp[i], stoneValue[i] + stoneValue[i + 1] + stoneValue[i + 2] - dp[i + 3])
            }
        }
        
        if dp[0] > 0 {
            return "Alice"
        } else if dp[0] < 0 {
            return "Bob"
        } else {
            return "Tie"
        }
    }
}
