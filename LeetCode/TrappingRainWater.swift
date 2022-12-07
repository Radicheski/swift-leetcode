//
//  TrappingRainWater.swift
//  https://leetcode.com/problems/trapping-rain-water/
//
//  Created by Erik Radicheski da Silva on 07/12/22.
//

import XCTest

final class TrappingRainWater: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.trap([4, 2, 0, 3, 2, 5]), 9)
    }

}

private class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var result = 0
        var leftMax = 0
        var rightMax = 0
        while left < right {
            if height[left] < height[right] {
                if height[left] >= leftMax {
                    leftMax = height[left]
                } else {
                    result += leftMax - height[left]
                }
                left += 1
            } else {
                if height[right] >= rightMax {
                    rightMax = height[right]
                } else {
                    result += rightMax - height[right]
                }
                right -= 1
            }
        }
        
        return result
    }
}
