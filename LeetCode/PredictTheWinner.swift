//
//  PredictTheWinner.swift
//  https://leetcode.com/problems/predict-the-winner/
//
//  Created by Erik Radicheski da Silva on 28/07/23.
//

import XCTest

final class PredictTheWinner: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.PredictTheWinner([1, 5, 2]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.PredictTheWinner([1, 5, 233, 7]))
    }

}

private class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        return maxDifference(nums, 0, nums.endIndex - 1) >= 0
    }
    
    private func maxDifference(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        guard left < right else { return nums[left] }
        
        let leftScore = nums[left] - maxDifference(nums, left + 1, right)
        let rightScore = nums[right] - maxDifference(nums, left, right - 1)
        
        return max(leftScore, rightScore)
    }
}
