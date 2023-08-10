//
//  SearchInRotatedSortedArray2.swift
//  https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
//
//  Created by Erik Radicheski da Silva on 10/08/23.
//

import XCTest

final class SearchInRotatedSortedArray2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.search([2, 5, 6, 0, 0, 1, 2], 0))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.search([2, 5, 6, 0, 0, 1, 2], 3))
    }

}

private class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.isEmpty == false else { return false }
        
        var end = nums.endIndex - 1
        var start = 0
        
        while start <= end {
            let middle = start + (end - start) / 2
            
            guard nums[middle] != target else { return true }
            
            guard nums[start] != nums[middle] else {
                start += 1
                continue
            }
            
            let pivotArray = nums[start] <= nums[middle]
            let targetArray = nums[start] <= target
            
            if (pivotArray && !targetArray) || (!pivotArray && targetArray) {
                if pivotArray {
                    start = middle + 1
                } else {
                    end = middle - 1
                }
            } else {
                if nums[middle] < target {
                    start = middle + 1
                } else {
                    end = middle - 1
                }
            }
            
        }
        
        return false
    }
}
