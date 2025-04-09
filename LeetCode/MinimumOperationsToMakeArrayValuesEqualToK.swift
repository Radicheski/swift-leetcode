//
//  MinimumOperationsToMakeArrayValuesEqualToK.swift
//  https://leetcode.com/problems/minimum-operations-to-make-array-values-equal-to-k/
//
//  Created by Erik Radicheski da Silva on 09/04/25.
//

import XCTest

final class MinimumOperationsToMakeArrayValuesEqualToK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([5, 2, 5, 4, 5], 2), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([2, 1, 2], 2), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minOperations([9, 7, 5, 3], 1), 4)
    }
    
}

private class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        let nums = Set(nums)
        
        guard nums.filter({ $0 < k }).count == 0 else { return -1 }
        
        return nums.filter({ $0 > k }).count
    }
}
