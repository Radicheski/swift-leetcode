//
//  ConstrainedSubsequenceSum.swift
//  https://leetcode.com/problems/constrained-subsequence-sum/
//
//  Created by Erik Radicheski da Silva on 21/10/23.
//

import XCTest

final class ConstrainedSubsequenceSum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.constrainedSubsetSum([10, 2, -10, 5, 20], 2), 37)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.constrainedSubsetSum([-1, -2, -3], 1), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.constrainedSubsetSum([10, -2, -10, -5, 20], 2), 23)
    }

}

private class Solution {
    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else { return nums[0] }
        
        var window = [(sum: Int, index: Int)]()
        var answer = nums[0]
        
        for (i, num) in nums.enumerated() {
            while let lastIndex = window.last?.index, i - lastIndex > k {
                let _ = window.removeLast()
            }
            
            let currentAnswer = num + max(0, window.last?.sum ?? 0)
            
            answer = max(answer, currentAnswer)
            
            var left = 0
            var right = window.endIndex
            
            while left < right {
                let middle = left + (right - left) / 2
                
                if currentAnswer < window[middle].sum {
                    right = middle
                } else {
                    left = middle + 1
                }
            }
            
            window.insert((currentAnswer, i), at: left)
            
        }
        
        return answer
    }
    
}
