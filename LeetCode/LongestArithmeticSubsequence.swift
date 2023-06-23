//
//  LongestArithmeticSubsequence.swift
//  https://leetcode.com/problems/longest-arithmetic-subsequence/
//
//  Created by Erik Radicheski da Silva on 23/06/23.
//

import XCTest

final class LongestArithmeticSubsequence: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestArithSeqLength([3, 6, 9, 12]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestArithSeqLength([9, 4, 7, 2, 10]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestArithSeqLength([20, 1, 15, 3, 10, 5, 8]), 4)
    }
    
}

private class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        var maxLength = 0
        
        var dp = [[Int: Int]]()
        
        for right in nums.indices {
            dp.append([:])
            
            for left in 0 ..< right {
                let diff = nums[left] - nums[right]
                let length = dp[left][diff, default: 1] + 1
                dp[right][diff] = length
                maxLength = max(maxLength, length)
            }
        }
        
        return maxLength
    }
}
