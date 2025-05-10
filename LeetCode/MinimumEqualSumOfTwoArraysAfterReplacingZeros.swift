//
//  MinimumEqualSumOfTwoArraysAfterReplacingZeros.swift
//  https://leetcode.com/problems/minimum-equal-sum-of-two-arrays-after-replacing-zeros/
//
//  Created by Erik Radicheski da Silva on 10/05/25.
//

import XCTest

final class MinimumEqualSumOfTwoArraysAfterReplacingZeros: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSum([3, 2, 0, 1, 0], [6, 5, 0]), 12)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSum([2, 0, 2, 0], [1, 4]), -1)
    }
    
}

private class Solution {
    func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let zeroCount1 = nums1.filter( { $0 == 0 } ).count
        let zeroCount2 = nums2.filter( { $0 == 0 } ).count
        
        let sum1 = nums1.reduce(into: 0, +=)
        let sum2 = nums2.reduce(into: 0, +=)
        
        if zeroCount1 > 0 && zeroCount2 > 0 {
            return max(sum1 + zeroCount1, sum2 + zeroCount2)
        }
        
        if zeroCount1 == 0 && zeroCount2 == 0 {
            return sum1 == sum2 ? sum1 : -1
        }
        
        if zeroCount1 == 0 && sum1 >= sum2 + zeroCount2 {
            return sum1
        }
        
        if zeroCount2 == 0 && sum2 >= sum1 + zeroCount1 {
            return sum2
        }
        
        return -1
    }
}
