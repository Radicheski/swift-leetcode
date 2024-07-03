//
//  Minimum DifferenceBetweenLargestAndSmallestValueInThreeMoves.swift
//  https://leetcode.com/problems/minimum-difference-between-largest-and-smallest-value-in-three-moves/
//
//  Created by Erik Radicheski da Silva on 03/07/24.
//

import XCTest

final class Minimum_DifferenceBetweenLargestAndSmallestValueInThreeMoves: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDifference([5, 3, 2, 4]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDifference([1, 5, 0, 10, 14]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minDifference([3, 100, 20]), 0)
    }
    
}

private class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else { return 0 }
        
        let nums = nums.sorted()
        let n = nums.count - 4
        var answer = Int.max
        
        for i in 0 ... 3 {
            answer = min(answer, nums[n + i] - nums[i])
        }
        
        return answer
    }
}
