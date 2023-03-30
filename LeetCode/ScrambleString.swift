//
//  ScrambleString.swift
//  https://leetcode.com/problems/scramble-string/
//
//  Created by Erik Radicheski da Silva on 30/03/23.
//

import XCTest

final class ScrambleString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isScramble("great", "rgeat"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isScramble("abcde", "caebd"))
    }
                      
    func testExampleC() {
        XCTAssertTrue(solution.isScramble("a", "a"))
    }

}

private class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)
        
        var dp = (0 ... s1.endIndex).map { _ in s1.map { _ in s2.map { _ in false } } }
        
        for i in s1.indices {
            for j in s2.indices {
                dp[1][i][j] = s1[i] == s2[j]
            }
        }
        
        for length in 0 ... s1.endIndex where length > 1 {
            for i in 0 ..< s1.endIndex + 1 - length {
                for j in 0 ..< s1.endIndex + 1 - length {
                    for newLength in 1 ..< length {
                        let dp1 = dp[newLength][i]
                        let dp2 = dp[length - newLength][i + newLength]
                        dp[length][i][j] = dp[length][i][j] || dp1[j] && dp2[j + newLength]
                        dp[length][i][j] = dp[length][i][j] || dp1[j + length - newLength] && dp2[j]
                    }
                }
            }
        }
        
        return dp.last![0][0]
    }
}
