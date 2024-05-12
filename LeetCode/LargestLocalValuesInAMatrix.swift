//
//  LargestLocalValuesInAMatrix.swift
//  https://leetcode.com/problems/largest-local-values-in-a-matrix/
//
//  Created by Erik Radicheski da Silva on 12/05/24.
//

import XCTest

final class LargestLocalValuesInAMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestLocal([[9, 9, 8, 1],
                                              [5, 6,2 ,6 ],
                                              [8, 2, 6, 4],
                                              [6, 2, 2, 2]]),
                       [[9, 9], [8, 6]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestLocal([[1, 1, 1, 1, 1],
                                              [1, 1, 1, 1, 1],
                                              [1, 1, 2, 1, 1],
                                              [1, 1, 1, 1, 1],
                                              [1, 1, 1, 1, 1]]),
                       [[2, 2, 2], [2, 2, 2], [2, 2, 2]])
    }
    
}

private class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        var answer = Array(repeating: Array(repeating: Int.min, count: grid.count - 2), count: grid.count - 2)
        
        for i in 1 ..< grid.endIndex - 1 {
            for j in 1 ..< grid[i].endIndex - 1 {
                for di in -1 ... 1 {
                    for dj in -1 ... 1 {
                        answer[i - 1][j - 1] = max(answer[i - 1][j - 1], grid[i + di][j + dj])
                    }
                }
            }
        }
        
        return answer
    }
}
