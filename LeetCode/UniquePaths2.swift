//
//  UniquePaths2.swift
//  https://leetcode.com/problems/unique-paths-ii/
//
//  Created by Erik Radicheski da Silva on 13/12/22.
//

import XCTest

final class UniquePaths2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.uniquePathsWithObstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.uniquePathsWithObstacles([[0, 1], [0, 0]]), 1)
    }

}

private class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        
        var possiblePaths = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        
        possiblePaths[m - 1][n - 1] = 1 - obstacleGrid[m - 1][n - 1]
        
        for row in (0 ..< m).reversed() {
            for column in (0 ..< n).reversed() {
                guard row != m - 1 || column != n - 1 else { continue }
                guard obstacleGrid[row][column] == 0 else {
                    possiblePaths[row][column] = 0
                    continue
                }
                
                var sum = 0
                
                sum += possiblePaths[row + 1][column]
                sum += possiblePaths[row][column + 1]
                
                possiblePaths[row][column] = sum
            }
        }
        
        return possiblePaths[0][0]
    }
}
