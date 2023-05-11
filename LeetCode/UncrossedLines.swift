//
//  UncrossedLines.swift
//  https://leetcode.com/problems/uncrossed-lines/
//
//  Created by Erik Radicheski da Silva on 10/05/23.
//

import XCTest

final class UncrossedLines: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxUncrossedLines([1, 4, 2], [1, 2, 4]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxUncrossedLines([2, 5, 1, 2, 5], [10, 5, 2, 1, 5, 2]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxUncrossedLines([1, 3, 7, 1, 7, 5], [1, 9, 2, 5, 1]), 2)
    }

}

private class Solution {
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp: [[Int?]] = (0 ... nums1.endIndex).map { _ in (0 ... nums2.endIndex).map { _ in nil } }
        
        return solve(nums1, nums1.endIndex, nums2, nums2.endIndex, &dp)
    }
    
    private func solve(_ nums1: [Int], _ index1: Int, _ nums2: [Int], _ index2: Int, _ dp: inout [[Int?]]) -> Int {
        guard index1 > 0 && index2 > 0 else { return 0 }
        
        if let result = dp[index1][index2] { return result }
        
        if nums1[index1 - 1] == nums2[index2 - 1] {
            dp[index1][index2] = 1 + solve(nums1, index1 - 1, nums2, index2 - 1, &dp)
        } else {
            dp[index1][index2] = max(solve(nums1, index1 - 1, nums2, index2, &dp), solve(nums1, index1, nums2, index2 - 1, &dp))
        }
        
        return dp[index1][index2]!
    }
}
