//
//  CountUnguardedCellsInTheGrid.swift
//  https://leetcode.com/problems/count-unguarded-cells-in-the-grid/
//
//  Created by Erik Radicheski da Silva on 21/11/24.
//

import XCTest

final class CountUnguardedCellsInTheGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countUnguarded(4, 6,  [[0, 0], [1, 1], [2, 3]], [[0, 1], [2, 2], [1, 4]]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countUnguarded(3, 3, [[1, 1]], [[0, 1], [1, 0], [2, 1], [1, 2]]), 4)
    }
    
}

private class Solution {
    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {
        var cells = Set<[Int]>()
        let obstacles = Set(guards + walls)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                cells.insert([i, j])
            }
        }
        
        cells.subtract(obstacles)
        
        for g in guards {
            for (dx, dy) in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
                var (x, y) = (g[0], g[1])
                
                while (0 ..< m).contains(x) && (0 ..< n).contains(y) {
                    x += dx
                    y += dy
                    
                    cells.remove([x, y])
                    
                    if obstacles.contains([x, y]) { break }
                }
                
            }
        }
        
        return cells.count
    }
}
