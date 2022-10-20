//
//  FindMinimumInRotatedSortedArray.swift
//  https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
//
//  Created by Erik Radicheski da Silva on 20/10/22.
//

import XCTest

final class FindMinimumInRotatedSortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMin([3, 4, 5, 1, 2]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMin([4, 5, 6, 7, 0, 1, 2]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findMin([11, 13, 15, 17]), 11)
    }

}

private class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var start = nums.startIndex
        var end = nums.endIndex - 1
        
        if nums[end] > nums[start] {
            return nums[start]
        }
        
        while start <= end {
            let middle = (start + end) / 2
            
            if nums[middle] > nums[middle + 1] {
                return nums[middle + 1]
            }
            
            if nums[middle - 1] > nums[middle] {
                return nums[middle]
            }
            
            if nums[middle] > nums[nums.startIndex] {
                start = middle + 1
            } else {
                end = middle - 1
            }
        }
        
        return nums[start]
    }
}
