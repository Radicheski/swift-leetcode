//
//  MakingALargeIsland.swift
//  https://leetcode.com/problems/making-a-large-island/
//
//  Created by Erik Radicheski da Silva on 31/01/25.
//

import XCTest

final class MakingALargeIsland: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestIsland([[1, 0], [0, 1]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestIsland([[1, 1], [1, 0]]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.largestIsland([[1, 1], [1, 1]]), 4)
    }
    
}

private class Solution {
    private let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func largestIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var islands = [Int: Int]()
        var shore = Set<[Int]>()
        var visited = Set<[Int]>()
        var maximumSize = Int.min
        
        for (i, row) in grid.enumerated() {
            for (j, cell) in row.enumerated() {
                if cell == 0 { continue }
                guard visited.insert([i, j]) == (true, [i, j]) else { continue }
                
                var queue = [(i, j)]
                var size = 0
                let island = islands.count + 1
                
                while let (i, j) = queue.popLast() {
                    grid[i][j] = island
                    size += 1
                    for (di, dj) in directions {
                        guard grid.indices.contains(i + di) else { continue }
                        guard grid[i + di].indices.contains(j + dj) else { continue }
                        guard visited.insert([i + di, j + dj]) == (true, [i + di, j + dj]) else { continue }
                        if grid[i + di][j + dj] == 0 {
                            shore.insert([i + di, j + dj])
                        } else {
                            queue.append((i + di, j + dj))
                        }
                    }
                }
                
                islands[island] = size
                maximumSize = max(maximumSize, size)
            }
        }
        
        if islands.isEmpty { return 1 }
        
        for beach in shore {
            let (i, j) = (beach[0], beach[1])
            var size = 1
            var neighbor = Set<Int>()
            
            for (di, dj) in directions {
                guard grid.indices.contains(i + di) else { continue }
                guard grid[i + di].indices.contains(j + dj) else { continue }
                
                if let islandSize = islands[grid[i + di][j + dj]],
                   neighbor.insert(grid[i + di][j + dj]) == (true, grid[i + di][j + dj]){
                    size += islandSize
                }
            }
            
            maximumSize = max(maximumSize, size)
        }
        
        return maximumSize
    }
}
