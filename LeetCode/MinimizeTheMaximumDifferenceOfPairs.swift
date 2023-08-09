//
//  MinimizeTheMaximumDifferenceOfPairs.swift
//  https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/
//
//  Created by Erik Radicheski da Silva on 09/08/23.
//

import XCTest

final class MinimizeTheMaximumDifferenceOfPairs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimizeMax([10, 1, 2, 7, 1, 3], 2), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimizeMax([4, 2, 1, 2], 1), 0)
    }
    
}

private class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        
        var left = 0
        var right = nums[n - 1] - nums[0]
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if countValidPairs(nums, middle) >= p {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    private func countValidPairs(_ nums: [Int], _ threshold: Int) -> Int {
        var count = 0
        var index = 0
        
        while index < nums.endIndex - 1 {
            if nums[index + 1] - nums[index] <= threshold {
                count += 1
                index += 1
            }
            
            index += 1
        }
        
        return count
    }
}
