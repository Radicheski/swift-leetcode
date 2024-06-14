//
//  MinimumIncrementToMakeArrayUnique.swift
//  https://leetcode.com/problems/minimum-increment-to-make-array-unique/
//
//  Created by Erik Radicheski da Silva on 14/06/24.
//

import XCTest

final class MinimumIncrementToMakeArrayUnique: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minIncrementForUnique([1, 2, 2]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minIncrementForUnique([3, 2, 1, 2, 1, 7]), 6)
    }
    
}

private class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        
        var nextAvailable = 0
        var count = 0
        
        for num in nums {
            if num >= nextAvailable {
                nextAvailable = num + 1
            } else {
                count += nextAvailable - num
                nextAvailable += 1
            }
        }
        
        return count
    }
}
