//
//  BinarySearch.swift
//  https://leetcode.com/problems/binary-search/
//
//  Created by Erik Radicheski da Silva on 22/08/22.
//

import XCTest

class BinarySearch: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.search([-1, 0, 3, 5, 9, 12], 9), 4)
        XCTAssertEqual(solution.search([-1, 0, 3, 5, 9, 12], 2), -1)
    }

}

private class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var startIndex = 0
        var endIndex = nums.count - 1
        
        while startIndex <= endIndex {
            let middleIndex = (startIndex + endIndex) / 2
            if nums[middleIndex] < target {
                startIndex = middleIndex + 1
            } else if nums[middleIndex] > target {
                endIndex = middleIndex - 1
            } else {
                return middleIndex
            }
        }
        
        return -1
    }
}
