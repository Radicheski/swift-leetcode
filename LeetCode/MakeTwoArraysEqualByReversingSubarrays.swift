//
//  MakeTwoArraysEqualByReversingSubarrays.swift
//  https://leetcode.com/problems/make-two-arrays-equal-by-reversing-subarrays/
//
//  Created by Erik Radicheski da Silva on 02/08/24.
//

import XCTest

final class MakeTwoArraysEqualByReversingSubarrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canBeEqual([1, 2, 3, 4], [2, 4, 1, 3]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canBeEqual([7], [7]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.canBeEqual([3, 7, 9], [3, 7, 11]))
    }
    
}

private class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        return target.sorted() == arr.sorted()
    }
}
