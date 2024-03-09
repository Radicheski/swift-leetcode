//
//  MinimumCommonValue.swift
//  https://leetcode.com/problems/minimum-common-value/
//
//  Created by Erik Radicheski da Silva on 08/03/24.
//

import XCTest

final class MinimumCommonValue: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getCommon([1, 2, 3], [2, 4]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getCommon([1, 2, 3, 6], [2, 3, 4, 5]), 2)
    }
    
}

private class Solution {
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        return Set(nums1).intersection(nums2).min() ?? -1
    }
}
