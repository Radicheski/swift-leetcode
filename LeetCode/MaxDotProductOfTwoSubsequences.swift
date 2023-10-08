//
//  MaxDotProductOfTwoSubsequences.swift
//  https://leetcode.com/problems/max-dot-product-of-two-subsequences/
//
//  Created by Erik Radicheski da Silva on 08/10/23.
//

import XCTest

final class MaxDotProductOfTwoSubsequences: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDotProduct([2, 1, -2, 5], [3, 0, -6]), 18)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDotProduct([3, -2], [2, -6, 7]), 21)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxDotProduct([-1, -1], [1, 1]), -1)
    }

}

private class Solution {
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var min1 = Int.max
        var max1 = Int.min
        
        for num in nums1 {
            min1 = min(min1, num)
            max1 = max(max1, num)
        }
        
        var min2 = Int.max
        var max2 = Int.min
        
        for num in nums2 {
            min2 = min(min2, num)
            max2 = max(max2, num)
        }
        
        if (max1 < 0 && min2 > 0) { return min2 * max1 }
        if (min1 > 0 && max2 < 0) { return min1 * max2 }
        
        var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: nums2.count), count: nums1.count)
        return maxDotProduct(nums1, nums2, 0, 0, &dp)
    }
    
    private func maxDotProduct(_ nums1: [Int], _ nums2: [Int], _ i: Int, _ j: Int, _ dp: inout [[Int?]]) -> Int {
        guard nums1.indices.contains(i) && nums2.indices.contains(j) else { return 0 }
        
        if let answer = dp[i][j] {
            return answer
        }
        
        var answer = nums1[i] * nums2[j] + maxDotProduct(nums1, nums2, i + 1, j + 1, &dp)
        answer = max(answer, maxDotProduct(nums1, nums2, i + 1, j, &dp))
        answer = max(answer, maxDotProduct(nums1, nums2, i, j + 1, &dp))
        
        dp[i][j] = answer
        
        return answer
    }
}
