//
//  WhereWillTheBallFall.swift
//  https://leetcode.com/problems/where-will-the-ball-fall/
//
//  Created by Erik Radicheski da Silva on 09/11/22.
//

import XCTest

final class WhereWillTheBallFall: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [[ 1,  1,  1, -1, -1],
                     [ 1,  1,  1, -1, -1],
                     [-1, -1, -1,  1,  1],
                     [ 1,  1,  1,  1, -1],
                     [-1, -1, -1, -1, -1]]
        let output = [1, -1, -1, -1, -1]
        XCTAssertEqual(solution.findBall(input), output)
    }
    
    func testExampleB() {
        let input = [[-1]]
        let output = [-1]
        XCTAssertEqual(solution.findBall(input), output)
    }
    
    func testExampleC() {
        let input = [[ 1,  1,  1,  1,  1,  1],
                     [-1, -1, -1, -1, -1, -1],
                     [ 1,  1,  1,  1,  1,  1],
                     [-1, -1, -1, -1, -1, -1]]
        let output = [0, 1, 2, 3, 4, -1]
        XCTAssertEqual(solution.findBall(input), output)
    }

}

private class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        var result = [Int]()
        
        for ball in 0 ..< grid[0].endIndex {
            let column = moveBall(grid, ball)
            result.append(column)
        }
        
        return result
    }
    
    private func moveBall(_ grid: [[Int]], _ column: Int) -> Int {
        var row = 0
        var column = column
        
        while row < grid.endIndex {
            
            let direction = grid[row][column]
            
            guard (0 ..< grid[0].endIndex).contains(column + direction) else { return -1 }
            let neighborDirection = grid[row][column + direction]
            
            guard direction == neighborDirection else { return -1 }
            
            row += 1
            column += direction
        }
        
        return column
    }
}
