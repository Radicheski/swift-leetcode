//
//  MaximumNumberOfFishInAGrid.swift
//  https://leetcode.com/problems/maximum-number-of-fish-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 28/01/25.
//

import XCTest

final class MaximumNumberOfFishInAGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMaxFish([[0, 2, 1, 0], [4, 0, 0, 3], [1, 0, 0, 4], [0, 3, 2, 0]]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMaxFish([[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 1]]), 1)
    }
    
}

private class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        var water = Set<[Int]>()
        
        for (i, row) in grid.enumerated() {
            for (j, cell) in row.enumerated() {
                if cell > 0 {
                    water.insert([i, j])
                }
            }
        }
        
        var answer = 0
        
        while let startCell = water.popFirst() {
            var queue = [startCell]
            var count = 0
            
            while let cell = queue.popLast() {
                let (i, j) = (cell[0], cell[1])
                count += grid[i][j]
                
                for (di, dj) in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
                    guard let nextCell = water.remove([i + di, j +  dj]) else { continue }
                    queue.append(nextCell)
                }
            }
            
            answer = max(answer, count)
        }
        
        return answer
    }
}
