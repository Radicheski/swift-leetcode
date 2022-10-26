//
//  ShortestPathInBinaryMatrix.swift
//  https://leetcode.com/problems/shortest-path-in-binary-matrix/
//
//  Created by Erik Radicheski da Silva on 26/10/22.
//

import XCTest

final class ShortestPathInBinaryMatrix: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestPathBinaryMatrix([[0, 1], [1, 0]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestPathBinaryMatrix([[0, 0, 0], [1, 1, 0], [1, 1, 0]]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.shortestPathBinaryMatrix([[1, 0, 0], [1, 1, 0], [1, 1, 0]]), -1)
    }

}

private class Solution {
    
    private let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
    private let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let maxX = grid.endIndex - 1
        let maxY = grid[0].endIndex - 1
        
        guard grid[0][0] == 0 && grid[maxX][maxY] == 0 else { return -1 }
        
        var visited = grid.map { $0.map { $0 == 1 } }
        
        var queue = [(x: Int, y: Int)]()
        queue.append((0,0))
        visited[0][0] = true
        
        var distance = 0
        while queue.isEmpty == false {
            var currentQueue = queue
            queue.removeAll(keepingCapacity: true)
            
            for point in currentQueue {
                
                if point.x == maxX && point.y == maxY {
                    return distance + 1
                }
                
                for i in 0 ..< 8 {
                    let nextX = point.x + dx[i]
                    let nextY = point.y + dy[i]
                    
                    if (0 ... maxX).contains(nextX)
                        && (0 ... maxY).contains(nextY)
                        && visited[nextX][nextY] == false
                        && grid[nextX][nextY] == 0 {
                        queue.append((nextX, nextY))
                        visited[nextX][nextY] = true
                    }
                }
                
            }
            distance += 1
        }
        
        return -1
    }
}
