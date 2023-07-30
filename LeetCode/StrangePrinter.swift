//
//  StrangePrinter.swift
//  https://leetcode.com/problems/strange-printer/
//
//  Created by Erik Radicheski da Silva on 30/07/23.
//

import XCTest

final class StrangePrinter: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.strangePrinter("aaabbb"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.strangePrinter("aba"), 2)
    }

}

private class Solution {
    func strangePrinter(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for length in 1 ... n {
            for left in 0 ... n - length {
                let right = left + length - 1
                var j = -1
                
                dp[left][right] = n
                
                for i in left ..< right {
                    if s[i] != s[right] && j == -1 {
                        j = i
                    }
                    if j != -1 {
                        dp[left][right] = min(dp[left][right], 1 + dp[j][i] + dp[i + 1][right])
                    }
                }
                
                if j == -1 {
                    dp[left][right] = 0
                }
            }
        }
        
        return dp[0][n - 1] + 1
    }
}
