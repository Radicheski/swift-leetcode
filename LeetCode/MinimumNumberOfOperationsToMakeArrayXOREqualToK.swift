//
//  MinimumNumberOfOperationsToMakeArrayXOREqualToK.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-make-array-xor-equal-to-k/
//
//  Created by Erik Radicheski da Silva on 29/04/24.
//

import XCTest

final class MinimumNumberOfOperationsToMakeArrayXOREqualToK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([2, 1, 3, 4], 1), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([2, 0, 2, 0], 0), 0)
    }
    
}

private class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        return (nums.reduce(into: 0, ^=) ^ k).nonzeroBitCount
    }
}
