//
//  SearchInRotatedSortedArray.swift
//  https://leetcode.com/problems/search-in-rotated-sorted-array/
//
//  Created by Erik Radicheski da Silva on 19/10/22.
//

import XCTest

final class SearchInRotatedSortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.search([4, 5, 6, 7, 0, 1, 2], 0), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.search([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.search([1], 0), -1)
    }

}

private class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.endIndex - 1
        
        while start < end {
            let middle = (start + end) / 2
            
            if nums[middle] > nums[end] {
                start = middle + 1
            } else {
                end = middle
            }
        }
        
        let rotationIndex = start
        
        start = 0
        end = nums.endIndex - 1
        
        while start <= end {
            let middle = (start + end) / 2
            let realMiddle = (middle + rotationIndex) % nums.count
            
            if nums[realMiddle] == target { return realMiddle }
            
            if nums[realMiddle] < target {
                start = middle + 1
            } else {
                end = middle - 1
            }
        }
        
        return -1
    }
}
