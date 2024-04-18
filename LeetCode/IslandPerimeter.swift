//
//  IslandPerimeter.swift
//  https://leetcode.com/problems/island-perimeter/
//
//  Created by Erik Radicheski da Silva on 18/04/24.
//

import XCTest

final class IslandPerimeter: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.islandPerimeter([[0, 1, 0, 0],
                                                 [1, 1, 1, 0],
                                                 [0, 1, 0, 0],
                                                 [1, 1, 0, 0]]), 16)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.islandPerimeter([[1]]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.islandPerimeter([[1, 0]]), 4)
    }
    
}

private class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        
        for i in grid.indices {
            for j in grid[i].indices where grid[i][j] == 1 {
                
                for delta in [-1, 1] {
                    if grid.indices.contains(i + delta) {
                        if grid[i][j] != grid[i + delta][j] {
                            perimeter += 1
                        }
                    } else {
                        perimeter += 1
                    }
                    
                    if grid[i].indices.contains(j + delta) {
                        if grid[i][j] != grid[i][j + delta] {
                            perimeter += 1
                        }
                    } else {
                        perimeter += 1
                    }
                }
                
            }
        }
        
        return perimeter
    }
}
