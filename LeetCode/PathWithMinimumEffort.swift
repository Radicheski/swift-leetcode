//
//  PathWithMinimumEffort.swift
//  https://leetcode.com/problems/path-with-minimum-effort/
//
//  Created by Erik Radicheski da Silva on 16/09/23.
//

import XCTest

final class PathWithMinimumEffort: XCTestCase {

    private let solution = Solution()
    
    func testExampleA () {
        XCTAssertEqual(solution.minimumEffortPath([[1, 2, 2], [3, 8, 2], [5, 3, 5]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumEffortPath([[1, 2, 3], [3, 8, 4], [5, 3, 5]]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumEffortPath([[1, 2, 1, 1, 1],
                                                   [1, 2, 1, 2, 1],
                                                   [1, 2, 1, 2, 1],
                                                   [1, 2, 1, 2, 1],
                                                   [1, 1, 1, 2, 1]]), 0)
    }

}

private class Solution {
    
    private let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let rows = heights.count
        let columns = heights[rows - 1].count
        
        var dp = Array(repeating: Array(repeating: Int.max, count: columns), count: rows)
        dp[0][0] = 0
        
        var queue = [(0,0)]
        
        while queue.isEmpty == false {
            let (row, column) = queue.removeFirst()
            
            for (dR, dC) in directions {
                let nextRow = row + dR
                let nextColumn = column + dC
                
                guard heights.indices.contains(nextRow) else { continue }
                guard heights[nextRow].indices.contains(nextColumn) else { continue }
                
                let effort = max(dp[row][column], abs(heights[row][column] - heights[nextRow][nextColumn]))
                
                guard dp[nextRow][nextColumn] > effort else { continue }
                
                dp[nextRow][nextColumn] = effort
                queue.append((nextRow, nextColumn))
                
            }
        }
        return dp[rows - 1][columns - 1]
    }
    
}
