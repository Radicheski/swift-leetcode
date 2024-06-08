//
//  ContinuousSubarraySum.swift
//  https://leetcode.com/problems/continuous-subarray-sum/
//
//  Created by Erik Radicheski da Silva on 08/06/24.
//

import XCTest

final class ContinuousSubarraySum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkSubarraySum([23, 2, 4, 6, 7], 6))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.checkSubarraySum([23, 2, 6, 4, 7], 6))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.checkSubarraySum([23, 2, 6, 4, 7], 13))
    }
    
}

private class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var prefix = Array(repeating: 0, count: nums.count + 1)
        
        for (i, num) in nums.enumerated() {
            prefix[i + 1] = (prefix[i] + num) % k
        }
        
        var indices = [Int: Int]()
        
        for (j, prefixMod) in prefix.enumerated() {
            if let i = indices[prefixMod] {
                if j > i + 1 { return true }
            } else {
                indices[prefixMod] = j
            }
        }
        
        return false
    }
}
