//
//  FindFirstAndLastPositionOfElementInSortedArray.swift
//  https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
//
//  Created by Erik Radicheski da Silva on 19/10/22.
//

import XCTest

final class FindFirstAndLastPositionOfElementInSortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.searchRange([5, 7, 7, 8, 8, 10], 8), [3, 4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.searchRange([5, 7, 7, 8, 8, 10], 6), [-1, -1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.searchRange([], 0), [-1, -1])
    }

}

private class Solution {
    
    private let notFound = -1
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let start = 0
        let end = nums.count - 1
        
        let first = first(nums, start, end, target)
        let last = last(nums, start, end, target)
        
        return [first, last]
    }
    
    private func first(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        guard start <= end else { return notFound }
        
        let middle = (start + end) / 2
        
        if nums[middle] == target {
            let left = first(nums, start, middle - 1, target)
            return (left == notFound) ? middle : left
        } else if nums[middle] > target {
            return first(nums, start, middle - 1, target)
        } else {
            return first(nums, middle + 1, end, target)
        }
    }
    
    private func last(_ nums: [Int], _ start: Int, _ end: Int, _ target: Int) -> Int {
        guard start <= end else { return notFound }
        
        let middle = (start + end) / 2
        
        if nums[middle] == target {
            let right = last(nums, middle + 1, end, target)
            return (right == notFound) ? middle : right
        } else if nums[middle] > target {
            return last(nums, start, middle - 1, target)
        } else {
            return last(nums, middle + 1, end, target)
        }
    }
}
