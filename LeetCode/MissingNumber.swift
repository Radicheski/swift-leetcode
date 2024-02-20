//
//  MissingNumber.swift
//  https://leetcode.com/problems/missing-number/
//
//  Created by Erik Radicheski da Silva on 20/02/24.
//

import XCTest

final class MissingNumber: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.missingNumber([3, 0, 1]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.missingNumber([0, 1]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]), 8)
    }

}

private class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var number = 0
        
        for (i, num) in nums.enumerated() {
            number ^= num
            number ^= i + 1
        }
        
        return number
    }
}
