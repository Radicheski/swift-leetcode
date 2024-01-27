//
//  KInversePairsArray.swift
//  https://leetcode.com/problems/k-inverse-pairs-array/
//
//  Created by Erik Radicheski da Silva on 27/01/24.
//

import XCTest

final class KInversePairsArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kInversePairs(3, 0), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.kInversePairs(3, 1), 2)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func kInversePairs(_ n: Int, _ k: Int) -> Int {
        guard k > 0 else { return 1 }
        
        var prefix = Array(repeating: 0, count: k + 1)
        prefix[0] = 1
        
        var dp = Array(repeating: prefix, count: n + 1)
        
        for i in 1 ... n {
            for j in 1 ... k {
                let start = max(0, j - i + 1)
                
                for k in start ... j {
                    dp[i][j] = (dp[i][j] + dp[i - 1][k]) % mod
                }
            }
        }
        
        return dp[n][k]
    }
}
