//
//  CherryPickup2.swift
//  https://leetcode.com/problems/cherry-pickup-ii/
//
//  Created by Erik Radicheski da Silva on 15/02/23.
//

import XCTest

final class CherryPickup2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.cherryPickup([[3, 1, 1],
                                              [2, 5, 1],
                                              [1, 5, 5],
                                              [2, 1, 1]]), 24)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.cherryPickup([[1, 0, 0, 0, 0, 0, 1],
                                              [2, 0, 0, 0, 0, 3, 0],
                                              [2, 0, 9, 0, 0, 0, 0],
                                              [0, 3, 0, 5, 4, 0, 0],
                                              [1, 0, 2, 3, 0, 0, 6]]), 28)
    }

}

private class Solution {
    
    private let directions = [-1, 0, 1]
    
    func cherryPickup(_ grid: [[Int]]) -> Int {
        let row = 0
        let robot1 = grid[row].startIndex
        let robot2 = grid[row].endIndex - 1
        
        let position = Position(row: row, robot1: robot1, robot2: robot2)
        var dp = [Position: Int]()
        
        return cherryPickup(position: position, grid: grid, dp: &dp)
    }
    
    private func cherryPickup(position: Position, grid: [[Int]], dp: inout [Position: Int]) -> Int {
        if let cherries = dp[position] {
            return cherries
        }
        
        let row = position.row
        let robot1 = position.robot1
        let robot2 = position.robot2
        
        guard grid.indices.contains(row) else { return 0 }
        guard grid[row].indices.contains(robot1) else { return 0 }
        guard grid[row].indices.contains(robot2) else { return 0 }
        
        let cherries = robot1 == robot2 ? grid[row][robot1] : grid[row][robot1] + grid[row][robot2]
        
        var nextCherries = 0
        
        for d1 in directions {
            for d2 in directions {
                let nextPosition = Position(row: row + 1, robot1: robot1 + d1, robot2: robot2 + d2)
                nextCherries = max(nextCherries, cherryPickup(position: nextPosition, grid: grid, dp: &dp))
            }
        }
        
        dp[position] = cherries + nextCherries
        
        return cherries + nextCherries
    }
    
    private struct Position: Hashable {
        let row: Int
        let robot1: Int
        let robot2: Int
    }
}
