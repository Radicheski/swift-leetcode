//
//  LongestCommonSubsequence.swift
//  https://leetcode.com/problems/longest-common-subsequence/
//
//  Created by Erik Radicheski da Silva on 04/11/22.
//

import XCTest

final class LongestCommonSubsequence: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestCommonSubsequence("abcde", "ace"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestCommonSubsequence("abc", "abc"), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestCommonSubsequence("abc", "def"), 0)
    }

}


private class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        
        var array = Array(repeating: Array(repeating: -1, count: text2.count + 1), count: text1.count + 1)
        
        return lcs(text1, text2, text1.count, text2.count, &array)
    }
    
    private func lcs(_ text1: [Character],
                     _ text2: [Character],
                     _ m: Int,
                     _ n: Int,
                     _ array: inout [[Int]]) -> Int {
        guard m > 0 && n > 0 else { return 0 }
        guard array[m][n] == -1 else { return array[m][n] }
        
        if text1[m - 1] == text2[n - 1] {
            array[m][n] = 1 + lcs(text1, text2, m - 1, n - 1, &array)
            return array[m][n]
        }
        
        array[m][n] = max(lcs(text1, text2, m, n - 1, &array), lcs(text1, text2, m - 1, n, &array))
        return array[m][n]
    }
}
