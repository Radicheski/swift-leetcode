//
//  New21Game.swift
//  https://leetcode.com/problems/new-21-game/
//
//  Created by Erik Radicheski da Silva on 25/05/23.
//

import XCTest

final class New21Game: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.new21Game(10, 1, 10), 1, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.new21Game(6, 1, 10), 0.6, accuracy: 1e-5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.new21Game(21, 17, 10), 0.73278, accuracy: 1e-5)
    }

}

private class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        guard n > 0 else { return 1 }
        
        var dp: [Double] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        var s: Double = k > 0 ? 1 : 0
        
        for i in 1 ... n {
            dp[i] = s / Double(maxPts)
            
            if i < k {
                s += dp[i]
            }
            
            if i - maxPts >= 0 && i - maxPts < k {
                s -= dp[i - maxPts]
            }
        }
        
        var answer: Double = 0
        for i in k ... n {
            answer += dp[i]
        }
        
        return answer
    }
}
