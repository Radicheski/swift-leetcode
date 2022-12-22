//
//  LargestPerimeterTriangle.swift
//  https://leetcode.com/problems/largest-perimeter-triangle/
//
//  Created by Erik Radicheski da Silva on 22/12/22.
//

import XCTest

final class LargestPerimeterTriangle: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestPerimeter([2, 1, 2]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestPerimeter([1, 2, 1, 10]), 0)
    }
    
}

private class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        for index in 0 ..< nums.endIndex - 2 {
            if nums[index] < nums[index + 1] + nums[index + 2] {
                return nums[index] + nums[index + 1] + nums[index + 2]
            }
        }
        return 0
    }
}
