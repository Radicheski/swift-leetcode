//
//  LongestContinuousSubarrayWithAbsoluteDiffLessThanOrEqualToLimit.swift
//  https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/
//
//  Created by Erik Radicheski da Silva on 23/06/24.
//

import XCTest

final class LongestContinuousSubarrayWithAbsoluteDiffLessThanOrEqualToLimit: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestSubarray([8, 2, 4, 7], 4), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestSubarray([10, 1, 2, 4, 7, 2], 5), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestSubarray([4, 2, 2, 2, 4, 4, 2, 2], 0), 3)
    }
    
}

private class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var minimum = Heap<(index: Int, number: Int)> { $0.number < $1.number}
        var maximum = Heap<(index: Int, number: Int)> { $0.number > $1.number}
        
        var maxLength = 0
        
        var left = 0
        
        for (right, num) in nums.enumerated() {
            minimum.insert((right, num))
            maximum.insert((right, num))
            
            while maximum.peek()!.number - minimum.peek()!.number > limit {
                left = min(maximum.peek()!.index, minimum.peek()!.index) + 1
                
                while maximum.peek()!.index < left {
                    maximum.remove()
                }
                
                while minimum.peek()!.index < left {
                    minimum.remove()
                }
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}
