//
//  LongestSquareStreakInAnArray.swift
//  https://leetcode.com/problems/longest-square-streak-in-an-array/
//
//  Created by Erik Radicheski da Silva on 28/10/24.
//

import XCTest

final class LongestSquareStreakInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestSquareStreak([4, 3, 6, 16, 8, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestSquareStreak([2, 3, 5, 6, 7]), -1)
    }
    
}

private class Solution {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        let nums = nums.sorted(by: >)
        var answer = -1
        var count = [Int: Int]()
        
        for num in nums {
            if let squareCount = count[num * num] {
                count[num] = squareCount + 1
                answer = max(answer, squareCount + 1)
            } else {
                count[num] = 1
            }
        }
        
        return answer
    }
}
