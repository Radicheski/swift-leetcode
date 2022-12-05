//
//  BestSightseeingPair.swift
//  https://leetcode.com/problems/best-sightseeing-pair/
//
//  Created by Erik Radicheski da Silva on 05/12/22.
//

import XCTest

final class BestSightseeingPair: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxScoreSightseeingPair([8, 1, 5, 2, 6]), 11)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxScoreSightseeingPair([1, 2]), 2)
    }

}

private class Solution {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var result = 0
        var current = 0
        
        for value in values {
            result = max(result, current + value)
            current = max(current, value) - 1
        }
        
        return result
    }
}
