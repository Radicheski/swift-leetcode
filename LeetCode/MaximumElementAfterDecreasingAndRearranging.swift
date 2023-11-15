//
//  MaximumElementAfterDecreasingAndRearranging.swift
//  https://leetcode.com/problems/maximum-element-after-decreasing-and-rearranging/
//
//  Created by Erik Radicheski da Silva on 15/11/23.
//

import XCTest

final class MaximumElementAfterDecreasingAndRearranging: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumElementAfterDecrementingAndRearranging([2, 2, 1, 2, 1]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumElementAfterDecrementingAndRearranging([100, 1, 1000]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumElementAfterDecrementingAndRearranging([1, 2, 3, 4, 5]), 5)
    }
    
}

private class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        var answer = 0
        
        for num in arr.sorted() {
            if num >= answer + 1 {
                answer += 1
            }
        }
        
        return answer
    }
}
