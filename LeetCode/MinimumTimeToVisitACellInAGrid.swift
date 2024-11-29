//
//  MinimumTimeToVisitACellInAGrid.swift
//  https://leetcode.com/problems/minimum-time-to-visit-a-cell-in-a-grid/
//
//  Created by Erik Radicheski da Silva on 29/11/24.
//

import XCTest

final class MinimumTimeToVisitACellInAGrid: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumTime([[0, 1, 3, 2], [5, 1, 2, 5], [4, 3, 8, 6]]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumTime([[0, 2, 4], [3, 2, 1], [1, 0, 4]]), -1)
    }
    
}

private class Solution {
    func minimumTime(_ grid: [[Int]]) -> Int {
        if grid[0][1] > 1 && grid[1][0] > 1 { return -1 }
        
        let m = grid.count
        let n = grid[0].count
        
        var queue = [(x: 0, y: 0, time: grid[0][0])]
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        while let (x, y, time) = queue.popLast() {
            if x == m - 1 && y == n - 1 { return time }
            
            if visited[x][y] { continue }
            visited[x][y] = true
            
            for (dx, dy) in [(0, 1), (1,0), (0, -1), (-1, 0)] {
                guard grid.indices.contains(x + dx) else { continue }
                guard grid[x + dx].indices.contains(y + dy) else { continue }
                if visited[x + dx][y + dy] { continue }
                
                let nextTime = grid[x + dx][y + dy] - time
                let waitTime = max(grid[x + dx][y + dy] - (nextTime % 2) + 1, time + 1)
                
                if let index = findIndex(waitTime, queue) {
                    queue.insert((x + dx, y + dy, waitTime), at: index)
                } else {
                    queue.append((x + dx, y + dy, waitTime))
                }
                
            }
        }
        
        return -1
    }
    
    private func findIndex(_ time: Int, _ queue: [(x: Int, y: Int, time: Int)]) -> Int? {
        guard let (_, _, lastTime) = queue.last else { return nil }
        
        guard time >= lastTime else { return nil }
        
        var left = 0
        var right = queue.endIndex - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if queue[middle].time > time {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return left
    }
}
