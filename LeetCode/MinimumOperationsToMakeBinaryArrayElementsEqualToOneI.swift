//
//  MinimumOperationsToMakeBinaryArrayElementsEqualToOneI.swift
//  https://leetcode.com/problems/minimum-operations-to-make-binary-array-elements-equal-to-one-i/
//
//  Created by Erik Radicheski da Silva on 19/03/25.
//

import XCTest

final class MinimumOperationsToMakeBinaryArrayElementsEqualToOneI: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations([0, 1, 1, 1, 0, 0]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations([0, 1, 1, 1]), -1)
    }
    
}

private class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var nums = nums
        var count = 0
        
        for i in 0 ..< nums.endIndex - 2 {
            if nums[i] == 1 { continue }
            
            nums[i + 1] = 1 - nums[i + 1]
            nums[i + 2] = 1 - nums[i + 2]
            
            count += 1
        }
        
        if nums.suffix(2) != [1, 1] { return -1 }
        
        return count
    }
}
