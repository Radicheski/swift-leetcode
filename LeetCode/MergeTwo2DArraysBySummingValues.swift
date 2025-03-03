//
//  MergeTwo2DArraysBySummingValues.swift
//  https://leetcode.com/problems/merge-two-2d-arrays-by-summing-values/
//
//  Created by Erik Radicheski da Silva on 03/03/25.
//

import XCTest

final class MergeTwo2DArraysBySummingValues: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mergeArrays([[1, 2], [2, 3], [4, 5]], [[1, 4], [3, 2], [4, 1]]), [[1, 6], [2, 3], [3, 2], [4, 6]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mergeArrays([[2, 4], [3, 6], [5, 5]], [[1, 3], [4, 3]]), [[1, 3], [2, 4], [3, 6], [4, 3], [5, 5]])
    }
    
}

private class Solution {
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var nums = [Int: Int]()
        
        for num in nums1 {
            nums[num[0], default: 0] += num[1]
        }
        
        for num in nums2 {
            nums[num[0], default: 0] += num[1]
        }
        
        return nums.keys.sorted().map { [$0, nums[$0]!] }
    }
}
