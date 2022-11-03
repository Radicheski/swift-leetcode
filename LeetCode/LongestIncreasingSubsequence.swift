//
//  LongestIncreasingSubsequence.swift
//  https://leetcode.com/problems/longest-increasing-subsequence/
//
//  Created by Erik Radicheski da Silva on 03/11/22.
//

import XCTest

final class LongestIncreasingSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lengthOfLIS([0, 1, 0, 3, 2, 3]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.lengthOfLIS([7, 7, 7, 7, 7, 7, 7]), 1)
    }
    
}

private class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        
        for i in 1 ..< nums.endIndex {
            for j in 0 ..< i where nums[j] < nums[i] {
                lis[i] = max(lis[i], lis[j] + 1)
            }
        }
        
        return lis.max() ?? 1
    }
}
