//
//  NearestExitFromEntranceInMaze.swift
//  https://leetcode.com/problems/nearest-exit-from-entrance-in-maze/
//
//  Created by Erik Radicheski da Silva on 26/01/23.
//

import XCTest

final class NearestExitFromEntranceInMaze: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let maze: [[Character]] = [["+", "+", ".", "+"],
                                   [".", ".", ".", "+"],
                                   ["+", "+", "+", "."]]
        XCTAssertEqual(solution.nearestExit(maze, [1, 2]), 1)
    }
    
    func testExampleB() {
        let maze: [[Character]] = [["+", "+", "+"],
                                   [".", ".", "."],
                                   ["+", "+", "+"]]
        XCTAssertEqual(solution.nearestExit(maze, [1, 0]), 2)
    }
    
    func testExampleC() {
        let maze: [[Character]] = [[".", "+"]]
        XCTAssertEqual(solution.nearestExit(maze, [0, 0]), -1)
    }

}

private class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var maze = maze
        var queue: [(x: Int, y: Int, distance: Int)] = [(entrance[0], entrance[1], 0)]
        let directions: [(dx: Int, dy: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        maze[entrance[0]][entrance[1]] = "+"
        
        while queue.isEmpty == false {
            let (x, y, distance) = queue.removeFirst()
            
            for direction in directions {
                let neighbor = (x: x + direction.dx, y: y + direction.dy, distance: distance + 1)
                
                guard maze.indices.contains(neighbor.x) else { continue }
                guard maze[neighbor.x].indices.contains(neighbor.y) else { continue }
                
                guard maze[neighbor.x][neighbor.y] == "." else { continue }
                
                maze[neighbor.x][neighbor.y] = "+"
                
                if neighbor.x == 0 || neighbor.y == 0 ||
                    neighbor.x == maze.endIndex - 1 || neighbor.y == maze[neighbor.x].endIndex - 1 {
                    return neighbor.distance
                }
                
                queue.append(neighbor)
            }
            
        }
        
        return -1
    }
}
