//
//  FindIfArrayCanBeSorted.swift
//  https://leetcode.com/problems/find-if-array-can-be-sorted/
//
//  Created by Erik Radicheski da Silva on 06/11/24.
//

import XCTest

final class FindIfArrayCanBeSorted: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canSortArray([8, 4, 2, 30, 15]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canSortArray([1, 2, 3, 4, 5]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canSortArray([3, 16, 8, 4, 2]))
    }
    
}

private class Solution {
    func canSortArray(_ nums: [Int]) -> Bool {
        var bitsSet = 0
        var lastMax = Int.min
        var currentMax = Int.min
        var currentMin = Int.max
        
        for num in nums {
            if num.nonzeroBitCount == bitsSet {
                currentMax = max(currentMax, num)
                currentMin = min(currentMin, num)
                
                guard lastMax < currentMin else { return false }
            } else {
                guard currentMax < num else { return false }
                
                bitsSet = num.nonzeroBitCount
                lastMax = currentMax
                currentMax = num
                currentMin = num
            }
        }
        
        return lastMax < currentMin
    }
}
