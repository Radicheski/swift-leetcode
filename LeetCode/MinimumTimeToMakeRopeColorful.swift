//
//  MinimumTimeToMakeRopeColorful.swift
//  https://leetcode.com/problems/minimum-time-to-make-rope-colorful/
//
//  Created by Erik Radicheski da Silva on 27/12/23.
//

import XCTest

final class MinimumTimeToMakeRopeColorful: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCost("abaac", [1, 2, 3, 4, 5]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCost("abc", [1, 2, 3]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minCost("aabaa", [1, 2, 3, 4, 1]), 2)
    }
    
}

private class Solution {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        var previousColor: Character?
        var maxColorTime = 0
        var answer = 0
        
        for (i, color) in colors.enumerated()  {
            if color == previousColor {
                if neededTime[i] > maxColorTime {
                    answer += maxColorTime
                    maxColorTime = neededTime[i]
                } else {
                    answer += neededTime[i]
                }
            } else {
                maxColorTime = neededTime[i]
            }
            
            previousColor = color
        }
        
        return answer
    }
}
