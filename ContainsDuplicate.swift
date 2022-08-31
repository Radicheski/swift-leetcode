//
//  ContainsDuplicate.swift
//  https://leetcode.com/problems/contains-duplicate/
//
//  Created by Erik Radicheski da Silva on 31/08/22.
//

import XCTest

class ContainsDuplicate: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertTrue(solution.containsDuplicate([1, 2, 3, 1]))
        XCTAssertFalse(solution.containsDuplicate([1, 2, 3, 4]))
        XCTAssertTrue(solution.containsDuplicate([1, 1, 1, 3, 3, 4, 3, 2, 4, 2]))
    }
    
}

private class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var uniqueNumbers = Set<Int>()
        
        for number in nums {
            if uniqueNumbers.contains(number) {
                return true
            } else {
                uniqueNumbers.insert(number)
            }
        }
        
        return false
    }
}
