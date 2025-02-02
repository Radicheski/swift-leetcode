//
//  CheckIfArrayIsSortedAndRotated.swift
//  https://leetcode.com/problems/check-if-array-is-sorted-and-rotated/
//
//  Created by Erik Radicheski da Silva on 02/02/25.
//

import XCTest

final class CheckIfArrayIsSortedAndRotated: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.check([3, 4, 5, 1, 2]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.check([2, 1, 3, 4]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.check([1, 2, 3]))
    }
    
}

private class Solution {
    func check(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        let nums = nums + [nums[0]]
        
        var start: Int?
        
        for i in 1 ..< nums.endIndex {
            if nums[i - 1] <= nums[i] { continue }
            
            guard start == nil else { return false }
            
            start = i
        }

        return true
    }
}
