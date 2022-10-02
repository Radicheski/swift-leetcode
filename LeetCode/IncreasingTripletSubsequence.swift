//
//  IncreasingTripletSubsequence.swift
//  https://leetcode.com/problems/increasing-triplet-subsequence/
//
//  Created by Erik Radicheski da Silva on 02/10/22.
//

import XCTest

final class IncreasingTripletSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.increasingTriplet([1, 2, 3, 4, 5]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.increasingTriplet([5, 4, 3, 2, 1]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.increasingTriplet([2, 1, 5, 0, 4, 6]))
    }
    
}

private class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }
        
        var minIndex = 0
        var minLeft = Array(repeating: -1, count: nums.count)
        
        for i in 1 ..< nums.count {
            if nums[i] <= nums[minIndex] {
                minIndex = i
            } else {
                minLeft[i] = minIndex
            }
        }
        
        var maxIndex = nums.count - 1
        var maxRight = Array(repeating: -1, count: nums.count)
        
        for i in 2 ... nums.count {
            if nums[nums.count - i] >= nums[maxIndex] {
                maxIndex = nums.count - i
            } else {
                maxRight[nums.count - i] = maxIndex
            }
        }
        
        for i in 0 ..< nums.count {
            if minLeft[i] != -1 && maxRight[i] != -1 {
                return true
            }
        }

        return false
    }
}
