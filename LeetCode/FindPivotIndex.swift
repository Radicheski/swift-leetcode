//
//  FindPivotIndex.swift
//  https://leetcode.com/problems/find-pivot-index/
//
//  Created by Erik Radicheski da Silva on 16/08/22.
//

import XCTest

class FindPivotIndex: XCTestCase {

    func test() {
        let solution = Solution()

        XCTAssertEqual(3, solution.pivotIndex([1, 7, 3, 6, 5, 6]))
        XCTAssertEqual(-1, solution.pivotIndex([1 ,2, 3]))
        XCTAssertEqual(0, solution.pivotIndex([2, 1, -1]))
    }

}

private class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        for index in 0..<nums.count {
            let left = nums[..<index].reduce(into: 0, +=)
            let right = nums[index + 1..<nums.count].reduce(into: 0, +=)
            if left == right {
                return index
            }
        }

        return -1
    }
}
