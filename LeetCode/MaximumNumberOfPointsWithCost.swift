//
//  MaximumNumberOfPointsWithCost.swift
//  https://leetcode.com/problems/maximum-number-of-points-with-cost/
//
//  Created by Erik Radicheski da Silva on 17/08/24.
//

import XCTest

final class MaximumNumberOfPointsWithCost: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxPoints([[1, 2, 3], [1, 5, 1], [3, 1, 1]]), 9)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxPoints([[1, 5], [2, 3], [4, 2]]), 11)
    }
    
}

private class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        var previousRow = points[0]
        
        for row in points[1...] {
            var leftMax = Array(repeating: 0, count: previousRow.count)
            var rightMax = Array(repeating: 0, count: previousRow.count)
            var currentRow = Array(repeating: 0, count: previousRow.count)
            
            leftMax[0] = previousRow[0]
            for col in 1 ..< previousRow.endIndex {
                leftMax[col] = max(leftMax[col - 1] - 1, previousRow[col])
            }
            
            rightMax[rightMax.count - 1] = previousRow[previousRow.count - 1]
            for col in stride(from: previousRow.endIndex - 2, through: 0, by: -1) {
                rightMax[col] = max(rightMax[col + 1] - 1, previousRow[col])
            }
            
            for (i, col) in row.enumerated() {
                currentRow[i] = col + max(leftMax[i], rightMax[i])
            }
            
            previousRow = currentRow
        }
        
        return previousRow.reduce(into: 0) { $0 = max($0, $1) }
    }
}
