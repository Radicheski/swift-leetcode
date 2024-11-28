//
//  MinimumObstacleRemovalToReachCorner.swift
//  https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner/
//
//  Created by Erik Radicheski da Silva on 28/11/24.
//

import XCTest

final class MinimumObstacleRemovalToReachCorner: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumObstacles([[0, 1, 1], [1, 1, 0], [1, 1, 0]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumObstacles([[0, 1, 0, 0, 0], [0, 1, 0, 1, 0], [0, 0, 0, 1, 0]]), 0)
    }
    
}

private class Solution {
    func minimumObstacles(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        var obstacles: [[Int?]] = Array(repeating: Array(repeating: nil, count: n), count: m)
        obstacles[0][0] = 0
        
        var queue = [(x: 0, y: 0)]
        
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()
            
            let count = obstacles[x][y]!
            
            for (dx, dy) in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
                guard (0 ..< m).contains(x + dx) else { continue }
                guard (0 ..< n).contains(y + dy) else { continue }
                
                guard obstacles[x + dx][y + dy] == nil else { continue }
                
                if grid[x + dx][y + dy] == 0 {
                    obstacles[x + dx][y + dy] = count
                    queue.insert((x + dx, y + dy), at: 0)
                } else if grid[x + dx][y + dy] == 1 {
                    obstacles[x + dx][y + dy] = count + 1
                    queue.append((x + dx, y + dy))
                }
            }
        }
        
        return obstacles[m - 1][n - 1]!
    }
}
