//
//  GridGame.swift
//  https://leetcode.com/problems/grid-game/
//
//  Created by Erik Radicheski da Silva on 21/01/25.
//

import XCTest

final class GridGame: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.gridGame([[2, 5, 4], [1, 5, 1]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.gridGame([[3, 3, 1], [8, 5, 2]]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.gridGame([[1, 3, 1, 15], [1, 3, 3, 1]]), 7)
    }
    
}

private class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        var firstRow = grid[0].reduce(into: 0, +=)
        var secondRow = 0
        
        var minimumSum = Int.max
        
        for i in grid[0].indices {
            firstRow -= grid[0][i]
            
            minimumSum = min(minimumSum, max(firstRow, secondRow))
            
            secondRow += grid[1][i]
        }
        
        return minimumSum
    }
}
