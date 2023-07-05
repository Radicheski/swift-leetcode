//
//  LongestSubarrayOfOnesAfterDeletingOneElement.swift
//  https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/
//
//  Created by Erik Radicheski da Silva on 05/07/23.
//

import XCTest

final class LongestSubarrayOfOnesAfterDeletingOneElement: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestSubarray([1, 1, 0, 1]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestSubarray([0, 1, 1, 1, 0, 1, 1, 0, 1]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestSubarray([1, 1, 1]), 2)
    }

}

private class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var start = 0
        var end = 0
        
        var zeros = 0
        
        var maxLength = Int.min
        
        while nums.indices.contains(end) {
            if nums[end] == 0 {
                zeros += 1
            }
            
            if zeros < 2 {
                var length = end - start
                maxLength = max(maxLength, length)
            }
            
            while zeros > 1 {
                if nums[start] == 0 {
                    zeros -= 1
                }
                
                start += 1
            }
            
            
            end += 1
        }
        
        return maxLength
    }
}
