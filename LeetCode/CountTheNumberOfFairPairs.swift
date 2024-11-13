//
//  CountTheNumberOfFairPairs.swift
//  https://leetcode.com/problems/count-the-number-of-fair-pairs/
//
//  Created by Erik Radicheski da Silva on 13/11/24.
//

import XCTest

final class CountTheNumberOfFairPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countFairPairs([0, 1, 7, 4, 4, 5], 3, 6), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countFairPairs([1, 7, 9, 2, 5], 11, 11), 1)
    }
    
}

private class Solution {
    func countFairPairs(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        let nums = nums.sorted()
        var count = 0
        
        for (i, num) in nums.enumerated() {
            let start = search(lower - num, i + 1, nums)
            let end = search(upper - num + 1, i + 1, nums)
            
            count += end - start
        }
        
        return count
    }
    
    private func search(_ num: Int, _ left: Int, _ nums: [Int]) -> Int {
        var left = left
        var right = nums.endIndex - 1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if nums[middle] >= num {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
}
