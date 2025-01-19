//
//  TrappingRainWater2.swift
//  https://leetcode.com/problems/trapping-rain-water-ii/
//
//  Created by Erik Radicheski da Silva on 19/01/25.
//

import XCTest

final class TrappingRainWater2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.trapRainWater([[1, 4, 3, 1, 3, 2], [3, 2, 1, 3, 2, 4], [2, 3, 3, 2, 3, 1]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.trapRainWater([[3, 3, 3, 3, 3], [3, 2, 2, 2, 3], [3, 2, 1, 2, 3], [3, 2, 2, 2, 3], [3, 3, 3, 3, 3]]), 10)
    }
    
}

private class Solution {
    
    private let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func trapRainWater(_ heightMap: [[Int]]) -> Int {
        let m = heightMap.count
        let n = heightMap[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var boundary = [(i: Int, j: Int, height: Int)]()
        var totalWaterVolume = 0
        
        for i in 0 ..< m {
            if visited[i][0] == false {
                visited[i][0] = true
                insert((i, 0, heightMap[i][0]), at: &boundary)
            }
            
            if visited[i][n - 1] == false {
                visited[i][n - 1] = true
                insert((i, n - 1, heightMap[i][n - 1]), at: &boundary)
            }
        }
        
        for j in 0 ..< n {
            if visited[0][j] == false {
                visited[0][j] = true
                insert((0, j, heightMap[0][j]), at: &boundary)
            }
            
            if visited[m - 1][j] == false {
                visited[m - 1][j] = true
                insert((m - 1, j, heightMap[m - 1][j]), at: &boundary)
            }
        }
        
        while let (i, j, height) = boundary.popLast() {
            for (di, dj) in directions {
                guard heightMap.indices.contains(i + di) else { continue }
                guard heightMap[i + di].indices.contains(j + dj) else { continue }
                if visited[i + di][j +  dj] { continue }
                
                if heightMap[i + di][j + dj] < height {
                    totalWaterVolume += height - heightMap[i + di][j + dj]
                }
                
                insert((i + di, j + dj, max(height, heightMap[i + di][j  + dj])), at: &boundary)
                visited[i + di][j + dj] = true
            }
        }
        
        return totalWaterVolume
    }
    
    private func insert(_ cell: (i: Int, j: Int, height: Int),
                        at boundary: inout [(i: Int, j: Int, height: Int)]) {
        var left = 0
        var right = boundary.endIndex - 1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if boundary[middle].height == cell.height {
                left = middle
                break
            } else if boundary[middle].height > cell.height {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        boundary.insert(cell, at: left)
    }
}
