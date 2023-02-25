//
//  LongestArithmeticSubsequenceOfGivenDifference.swift
//  https://leetcode.com/problems/longest-arithmetic-subsequence-of-given-difference/
//
//  Created by Erik Radicheski da Silva on 25/02/23.
//

import XCTest

final class LongestArithmeticSubsequenceOfGivenDifference: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestSubsequence([1, 2, 3, 4], 1), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestSubsequence([1, 3, 5, 7], 1), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestSubsequence([1, 5, 7, 8, 5, 3, 4, 2, 1], -2), 4)
    }

}

private class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp = [Int: Int]()
        
        var result = 0
        
        for number in arr {
            let length = dp[number - difference, default: 0] + 1
            
            dp[number] = length
            result = max(result, length)
        }
        
        return result
    }
}
