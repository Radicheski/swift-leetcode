//
//  FinalArrayStateAfterKMultiplicationOperations1.swift
//  https://leetcode.com/problems/final-array-state-after-k-multiplication-operations-i/
//
//  Created by Erik Radicheski da Silva on 16/12/24.
//

import XCTest

final class FinalArrayStateAfterKMultiplicationOperations1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getFinalState([2, 1, 3, 5, 6], 5, 2), [8, 4, 6, 5, 6])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getFinalState([1, 2], 3, 4), [16, 8])
    }
    
}

private class Solution {
    func getFinalState(_ nums: [Int], _ k: Int, _ multiplier: Int) -> [Int] {
        var nums = nums.enumerated().sorted { $0.element == $1.element ? $0.offset < $1.offset : $0.element < $1.element }
        
        for _ in 0 ..< k {
            nums[0].element *= multiplier
            nums.sort { $0.element == $1.element ? $0.offset < $1.offset : $0.element < $1.element }
        }
        
        return nums.sorted { $0.offset < $1.offset }.map { $0.element }
    }
}
