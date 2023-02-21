//
//  SingleElementInASortedArray.swift
//  https://leetcode.com/problems/single-element-in-a-sorted-array/
//
//  Created by Erik Radicheski da Silva on 21/02/23.
//

import XCTest

final class SingleElementInASortedArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.singleNonDuplicate([1, 1, 2, 3, 3, 4, 4, 8, 8]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.singleNonDuplicate([3, 3, 7, 7, 10, 11, 11]), 10)
    }

}

private class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var left = 0
        var right = nums.endIndex - 1
        
        while left < right {
            let middle = (left + right) / 2
            
            if middle.isMultiple(of: 2) == false {
                if middle < nums.endIndex - 1 && nums[middle] == nums[middle + 1] {
                    right = middle - 1
                } else if middle > 0 && nums[middle] == nums[middle - 1] {
                    left = middle + 1
                } else {
                    return nums[middle]
                }
            } else {
                if middle < nums.endIndex - 1 && nums[middle] == nums[middle + 1] {
                    left = middle + 1
                } else if middle > 0 && nums[middle] == nums[middle - 1] {
                    right = middle - 1
                } else {
                    return nums[middle]
                }
            }
        }
        
        return nums[left]
    }
}
