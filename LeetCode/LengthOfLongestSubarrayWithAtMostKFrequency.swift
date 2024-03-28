//
//  LengthOfLongestSubarrayWithAtMostKFrequency.swift
//  https://leetcode.com/problems/length-of-longest-subarray-with-at-most-k-frequency/
//
//  Created by Erik Radicheski da Silva on 28/03/24.
//

import XCTest

final class LengthOfLongestSubarrayWithAtMostKFrequency: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSubarrayLength([1, 2, 3, 1, 2, 3, 1, 2], 2), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSubarrayLength([1, 2, 1, 2, 1, 2, 1, 2], 1), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxSubarrayLength([5, 5, 5, 5, 5, 5, 5], 4), 4)
    }
    
}

private class Solution {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var length = 0
        
        var left = 0
        var count = [Int: Int]()
        
        for (right, num) in nums.enumerated() {
            count[num, default: 0] += 1
            
            while let frequency = count[num],
                  frequency > k {
                let leftNum = nums[left]
                count[leftNum, default: 0] -= 1
                left += 1
            }
            
            length = max(length, right - left + 1)
        }
        
        return length
    }
}
