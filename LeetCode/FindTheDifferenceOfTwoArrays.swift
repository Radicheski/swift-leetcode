//
//  FindTheDifferenceOfTwoArrays.swift
//  https://leetcode.com/problems/find-the-difference-of-two-arrays/
//
//  Created by Erik Radicheski da Silva on 03/05/23.
//

import XCTest

final class FindTheDifferenceOfTwoArrays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findDifference([1, 2, 3], [2, 4, 6]), [[1, 3], [4, 6]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findDifference([1, 2, 3, 3], [1, 1, 2, 2]), [[3], []])
    }

}

private class Solution {
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let nums1 = Set(nums1)
        let nums2 = Set(nums2)
        
        return [nums1.subtracting(nums2), nums2.subtracting(nums1)].map(Array.init)
    }
}
