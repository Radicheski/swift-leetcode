//
//  LongestStrictlyIncreasingOrStrictlyDecreasingSubarray.swift
//  https://leetcode.com/problems/longest-strictly-increasing-or-strictly-decreasing-subarray/
//
//  Created by Erik Radicheski da Silva on 03/02/25.
//

import XCTest

final class LongestStrictlyIncreasingOrStrictlyDecreasingSubarray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestMonotonicSubarray([1, 4, 3, 3, 2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestMonotonicSubarray([3, 3, 3, 3]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestMonotonicSubarray([3, 2, 1]), 3)
    }
    
}

private class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 1 }
        
        var answer = 1
        
        var decreasing = 1
        var increasing = 1
        
        for i in 1 ..< nums.endIndex {
            if nums[i - 1] < nums[i] {
                increasing += 1
                answer = max(answer, increasing)
            } else {
                increasing = 1
            }
            
            if nums[i - 1] > nums[i] {
                decreasing += 1
                answer = max(answer, decreasing)
            } else {
                decreasing = 1
            }
        }
        
        return answer
    }
}
