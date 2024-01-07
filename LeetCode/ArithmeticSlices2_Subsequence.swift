//
//  ArithmeticSlices2_Subsequence.swift
//  https://leetcode.com/problems/arithmetic-slices-ii-subsequence/
//
//  Created by Erik Radicheski da Silva on 07/01/24.
//

import XCTest

final class ArithmeticSlices2_Subsequence: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfArithmeticSlices([2, 4, 6, 8, 10]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfArithmeticSlices([7, 7, 7, 7, 7]), 16)
    }

}

private class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        
        var answer = 0
        var dp = Array(repeating: [Int: Int](), count: nums.count)
        
        for i in 1 ..< nums.endIndex {
            for j in 0 ..< i {
                let step = nums[i] - nums[j]
                dp[i][step, default: 0] += 1
                
                if let count = dp[j][step] {
                    dp[i][step, default: 0] += count
                    answer += count
                }
            }
        }
        
        return answer
    }
}
