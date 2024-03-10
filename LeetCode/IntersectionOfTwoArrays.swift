//
//  IntersectionOfTwoArrays.swift
//  https://leetcode.com/problems/intersection-of-two-arrays/
//
//  Created by Erik Radicheski da Silva on 10/03/24.
//

import XCTest

final class IntersectionOfTwoArrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.intersection([1, 2, 2, 1], [2, 2]), [2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.intersection([4, 9, 5], [9, 4, 9, 8, 4]), [9, 4])
    }
    
}

private class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1).intersection(nums2))
    }
}
