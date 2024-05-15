//
//  FindTheSafestPathInAGrid.swift
//  https://leetcode.com/problems/find-the-safest-path-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 15/05/24.
//

import XCTest

final class FindTheSafestPathInAGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumSafenessFactor([[1, 0, 0], [0, 0, 0], [0, 0, 1]]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumSafenessFactor([[0, 0, 1], [0, 0, 0], [0, 0, 0]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumSafenessFactor([[0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0], [1, 0, 0, 0]]), 2)
    }
    
}

private class Solution {
    
    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    
    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        var thieves = [(i: Int, j: Int)]()
        
        var distances = grid.map { row in row.map { $0 - 1 } }
        
        for (i, row) in grid.enumerated() {
            for (j, cell) in row.enumerated() where cell == 1 {
                thieves.append((i, j))
            }
        }
        
        while thieves.isEmpty == false {
            let (i, j) = thieves.removeFirst()
            
            for (di, dj) in directions {
                let (I, J) = (i + di, j + dj)
                
                guard distances.indices.contains(I) else { continue }
                guard distances[I].indices.contains(J) else { continue }
                guard distances[I][J] == -1 else { continue }
                
                distances[I][J] = distances[i][j] + 1
                thieves.append((I, J))
            }
            
        }
        
        var left = 0
        var right = distances.reduce(into: 0, { $0 = max($0, $1.max() ?? 0) } )
        
        var answer = 0
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if hasSafePath(distances, middle) {
                answer = middle
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return answer
    }
    
    private func hasSafePath(_ distances: [[Int]], _ safeness: Int) -> Bool {
        let n = distances.count
        
        guard distances[0][0] >= safeness && distances[n - 1][n - 1] >= safeness else { return false }
        
        var visited = distances.map { $0.map { _ in false } }
        var queue = [(0, 0)]
        visited[0][0] = true
        
        while queue.isEmpty == false {
            let (i, j) = queue.removeFirst()
            
            for (di, dj) in directions {
                let (I, J) = (i + di, j + dj)
                
                guard distances.indices.contains(I) else { continue }
                guard distances[I].indices.contains(J) else { continue }
                guard visited[I][J] == false else { continue }
                
                visited[I][J] = true
                
                guard distances[I][J] >= safeness else { continue }
                guard I < n - 1 || J < n - 1 else { return true }
                
                queue.append((I, J))
            }
        }
        
        return false
    }
}
