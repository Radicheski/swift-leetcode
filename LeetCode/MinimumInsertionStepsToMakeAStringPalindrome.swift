//
//  MinimumInsertionStepsToMakeAStringPalindrome.swift
//  https://leetcode.com/problems/minimum-insertion-steps-to-make-a-string-palindrome/
//
//  Created by Erik Radicheski da Silva on 22/04/23.
//

import XCTest

final class MinimumInsertionStepsToMakeAStringPalindrome: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minInsertions("zzazz"), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minInsertions("mbadm"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minInsertions("leetcode"), 5)
    }
    
}

private class Solution {
    func minInsertions(_ s: String) -> Int {
        let s1 = Array(s)
        let s2 = Array(s1.reversed())
        
        let n = s1.count
        
        var memo = (0 ... n).map { _ in (0 ... n).map { _ in -1 }}
        
        return n - lcs(s1, s2, n, n, &memo)
    }
    
    private func lcs(_ s1: [Character], _ s2: [Character], _ m: Int, _ n: Int,
                     _ memo: inout [[Int]]) -> Int {
        guard m != 0 && n != 0 else { return 0 }
        
        guard memo[m][n] == -1 else { return memo[m][n] }
        
        if s1[m - 1] == s2[n - 1] {
            memo[m][n] = 1 + lcs(s1, s2, m - 1, n - 1, &memo)
            return memo[m][n]
        }
        
        memo[m][n] = max(lcs(s1, s2, m - 1, n, &memo), lcs(s1, s2, m, n - 1, &memo))
        return memo[m][n]
    }
}
