//
//  LastDayWhereYouCanStillCross.swift
//  https://leetcode.com/problems/last-day-where-you-can-still-cross/
//
//  Created by Erik Radicheski da Silva on 30/06/23.
//

import XCTest

final class LastDayWhereYouCanStillCross: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.latestDayToCross(2, 2, [[1, 1], [2, 1], [1, 2], [2, 2]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.latestDayToCross(2, 2, [[1, 1], [1, 2], [2, 1], [2, 2]]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.latestDayToCross(3, 3, [[1, 2], [2, 1], [3, 3], [2, 2], [1, 1], [1, 3], [2, 3], [3, 2], [3, 1]]), 3)
    }

}

private class Solution {
    private let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]
    
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        var left = 1
        var right = row * col
        
        while left < right {
            let middle = right - (right - left) / 2
            
            if canCross(row, col, cells, middle) {
                left = middle
            } else {
                right = middle - 1
            }
        }
        
        return left
    }
    
    private func canCross(_ row: Int, _ col: Int, _ cells: [[Int]], _ day: Int) -> Bool {
        var grid = Array(repeating: Array(repeating: 0, count: col), count: row)
        var queue = [[Int]]()
        
        for i in 0 ..< day {
            grid[cells[i][0] - 1][cells[i][1] - 1] = 1
        }
        
        for i in 0 ..< col {
            if grid[0][i] == 0 {
                queue.append([0, i])
                grid[0][i] = -1
            }
        }
        
        while queue.isEmpty == false {
            let current = queue.removeFirst()
            let (r, c) = (current[0], current[1])
            
            if r == row - 1 {
                return true
            }
            
            for direction in directions {
                let (newRow, newCol) = (r + direction[0], c + direction[1])
                
                if grid.indices.contains(newRow) && grid[newRow].indices.contains(newCol)
                    && grid[newRow][newCol] == 0{
                    grid[newRow][newCol] = -1
                    queue.append([newRow, newCol])
                }
            }
        }
        
        return false
    }
}
