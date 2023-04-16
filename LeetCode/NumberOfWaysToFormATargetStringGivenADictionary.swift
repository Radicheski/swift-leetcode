//
//  NumberOfWaysToFormATargetStringGivenADictionary.swift
//  https://leetcode.com/problems/number-of-ways-to-form-a-target-string-given-a-dictionary/
//
//  Created by Erik Radicheski da Silva on 16/04/23.
//

import XCTest

final class NumberOfWaysToFormATargetStringGivenADictionary: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numWays(["acca", "bbbb", "caca"], "aba"), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numWays(["abba", "baab"], "bab"), 4)
    }

}

private class Solution {
    func numWays(_ words: [String], _ target: String) -> Int {
        let words = words.map(Array.init)
        let target = Array(target)
        
        let m = target.count
        let k = words[0].count
        var count = (0 ..< 26).map { _ in (0 ..< k).map { _ in 0 } }
        
        for j in 0 ..< k {
            for word in words {
                count[Int(word[j].asciiValue!) - 97][j] += 1
            }
        }
        
        var dp = (0 ..< m + 1).map { _ in (0 ..< k + 1).map { _ in 0 } }
        dp[0][0] = 1
        
        let mod = 1000000007
        
        for i in 0 ... m {
            for j in 0 ..< k {
                if i < m {
                    dp[i + 1][j + 1] += count[Int(target[i].asciiValue!) - 97][j] * dp[i][j]
                    dp[i + 1][j + 1] %= mod
                }
                dp[i][j + 1] += dp[i][j]
                dp[i][j + 1] %= mod
            }
        }
        
        return dp[m][k]
    }
}
