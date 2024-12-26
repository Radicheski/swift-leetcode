//
//  TargetSum.swift
//  https://leetcode.com/problems/target-sum/
//
//  Created by Erik Radicheski da Silva on 26/12/24.
//

import XCTest

final class TargetSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findTargetSumWays([1, 1, 1, 1, 1], 3), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findTargetSumWays([1], 1), 1)
    }
    
}

private class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        return findTarget(0, nums, target)
    }
    
    private func findTarget(_ i: Int, _ nums: [Int], _ target: Int) -> Int {
        guard nums.indices.contains(i) else { return target == 0 ? 1 : 0 }
        
        let plus = findTarget(i + 1, nums, target - nums[i])
        let minus = findTarget(i + 1, nums, target + nums[i])
        
        return plus + minus
    }
}
