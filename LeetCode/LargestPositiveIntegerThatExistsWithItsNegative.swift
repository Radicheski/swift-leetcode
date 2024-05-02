//
//  LargestPositiveIntegerThatExistsWithItsNegative.swift
//  https://leetcode.com/problems/largest-positive-integer-that-exists-with-its-negative/
//
//  Created by Erik Radicheski da Silva on 02/05/24.
//

import XCTest

final class LargestPositiveIntegerThatExistsWithItsNegative: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMaxK([-1, 2, -3, 3]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMaxK([-1, 10, 6, 7, -7, 1]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findMaxK([-10, 8, 6, 7, -2, -3]), -1)
    }
    
}

private class Solution {
    func findMaxK(_ nums: [Int]) -> Int {
        var negatives = Set<Int>()
        var positives = Set<Int>()
        
        var answer = -1
        
        for num in nums {
            if num < 0 {
                negatives.insert(num)
            } else if num > 0 {
                positives.insert(num)
            }
        }
        
        for positive in positives {
            if negatives.contains(-positive) {
                answer = max(answer, positive)
            }
        }
        
        return answer
    }
}
