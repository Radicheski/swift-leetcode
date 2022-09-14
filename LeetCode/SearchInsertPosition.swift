//
//  SearchInsertPosition.swift
//  https://leetcode.com/problems/search-insert-position/
//
//  Created by Erik Radicheski da Silva on 14/09/22.
//

import XCTest

final class SearchInsertPosition: XCTestCase {

    private let solution = Solution()
    
    func testCaseA() {
        let inputArray = [1, 3, 5, 6]
        let inputTarget = 5
        
        let output = 2
        
        XCTAssertEqual(solution.searchInsert(inputArray, inputTarget), output)
    }
    
    func testCaseB() {
        let inputArray = [1, 3, 5, 6]
        let inputTarget = 2
        
        let output = 1
        
        XCTAssertEqual(solution.searchInsert(inputArray, inputTarget), output)
    }
    
    func testCaseC() {
        let inputArray = [1, 3, 5, 6]
        let inputTarget = 7
        
        let output = 4
        
        XCTAssertEqual(solution.searchInsert(inputArray, inputTarget), output)
    }

}

private class Solution {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var firstIndex = 0
        var lastIndex = nums.count - 1
        
        while firstIndex <= lastIndex {
            let middleIndex = (firstIndex + lastIndex) / 2
            if nums[middleIndex] == target { return middleIndex }
            else if nums[middleIndex] > target { lastIndex = middleIndex - 1 }
            else if nums[middleIndex] < target { firstIndex = middleIndex + 1 }
        }
        
        return firstIndex
    }
    
}
