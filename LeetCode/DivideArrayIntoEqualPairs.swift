//
//  DivideArrayIntoEqualPairs.swift
//  https://leetcode.com/problems/divide-array-into-equal-pairs/
//
//  Created by Erik Radicheski da Silva on 17/03/25.
//

import XCTest

final class DivideArrayIntoEqualPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.divideArray([3, 2, 3, 2, 2, 2]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.divideArray([1, 2, 3, 4]))
    }
    
}

private class Solution {
    func divideArray(_ nums: [Int]) -> Bool {
        let count = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
        
        for (_, c) in count {
            guard c.isMultiple(of: 2) else { return false }
        }
        
        return true
    }
}
