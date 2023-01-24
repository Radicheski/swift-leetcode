//
//  AsFarFromLandAsPossible.swift
//  https://leetcode.com/problems/as-far-from-land-as-possible/
//
//  Created by Erik Radicheski da Silva on 24/01/23.
//

import XCTest

final class AsFarFromLandAsPossible: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let grid = [[1, 0, 1],
                    [0, 0, 0],
                    [1, 0, 1]]
        XCTAssertEqual(solution.maxDistance(grid), 2)
    }
    
    func testExampleB() {
        let grid = [[1, 0, 0],
                    [0, 0, 0],
                    [0, 0, 0]]
        XCTAssertEqual(solution.maxDistance(grid), 4)
    }

}

private class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        let maximumDistance = grid.count + grid[0].count + 1
        
        var distance = grid.map { $0.map { _ in maximumDistance } }
        
        for i in grid.indices {
            for j in grid[i].indices {
                if grid[i][j] == 1 {
                    distance[i][j] = 0
                } else {
                    let currentDistanceA = grid.indices.contains(i - 1) ? distance[i - 1][j] : maximumDistance
                    let currentDistanceB = grid.indices.contains(j - 1) ? distance[i][j - 1] : maximumDistance
                    distance[i][j] = min(min(currentDistanceA, currentDistanceB) + 1, distance[i][j])
                }
            }
        }
        
        for i in grid.indices.reversed() {
            for j in grid[i].indices.reversed() {
                if grid[i][j] == 1 {
                    distance[i][j] = 0
                } else {
                    let currentDistanceA = grid.indices.contains(i + 1) ? distance[i + 1][j] : maximumDistance
                    let currentDistanceB = grid.indices.contains(j + 1) ? distance[i][j + 1] : maximumDistance
                    distance[i][j] = min(min(currentDistanceA, currentDistanceB) + 1, distance[i][j])
                }

            }
        }
        
        let result = distance.compactMap { $0.max() }.max() ?? maximumDistance
        
        if result == maximumDistance || result == 0 {
            return -1
        } else {
            return result
        }
    }
}
