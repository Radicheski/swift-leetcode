//
//  NumberOfLongestIncreasingSubsequence.swift
//  https://leetcode.com/problems/number-of-longest-increasing-subsequence/
//
//  Created by Erik Radicheski da Silva on 03/11/22.
//

import XCTest

final class NumberOfLongestIncreasingSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findNumberOfLIS([1, 3, 5, 4, 7]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findNumberOfLIS([2, 2, 2, 2, 2]), 5)
    }
    
}

private class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var lis = Array(repeating: 1, count: nums.count)
        var count = Array(repeating: 1, count: nums.count)
        
        for i in 1 ..< nums.endIndex {
            for j in 0 ..< i where nums[j] < nums[i] {
                if lis[j] + 1 > lis[i] {
                    lis[i] = lis[j] + 1
                    count[i] = count[j]
                } else if lis[j] + 1 == lis[i] {
                    count[i] += count[j]
                }
            }
        }
        
        let maxLength = lis.max() ?? 1
        var result = 0
        
        lis.enumerated()
            .filter { $0.element == maxLength }
            .forEach { result += count[$0.offset] }
        
        return result
    }
}
