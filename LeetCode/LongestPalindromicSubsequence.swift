//
//  LongestPalindromicSubsequence.swift
//  https://leetcode.com/problems/longest-palindromic-subsequence/
//
//  Created by Erik Radicheski da Silva on 15/12/22.
//

import XCTest

final class LongestPalindromicSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestPalindromeSubseq("bbbab"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestPalindromeSubseq("cbbd"), 2)
    }
    
}

private class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        
        for left in (0 ..< s.endIndex).reversed() {
            dp[left][left] = 1
            for right in left + 1 ..< s.endIndex {
                if s[left] == s[right] {
                    dp[left][right] = dp[left + 1][right - 1] + 2
                } else {
                    dp[left][right] = max(dp[left + 1][right], dp[left][right - 1])
                }
            }
        }
        
        return dp[0][s.count - 1]
    }
}
