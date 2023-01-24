//
//  SnakesAndLadders.swift
//  https://leetcode.com/problems/snakes-and-ladders/description/
//
//  Created by Erik Radicheski da Silva on 24/01/23.
//

import XCTest

final class SnakesAndLadders: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let board = [[-1, -1, -1, -1, -1, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, 35, -1, -1, 13, -1],
                     [-1, -1, -1, -1, -1, -1],
                     [-1, 15, -1, -1, -1, -1]]
        XCTAssertEqual(solution.snakesAndLadders(board), 4)
    }
    
    func testExampleB() {
        let board = [[-1, -1],
                     [-1, 3]]
        XCTAssertEqual(solution.snakesAndLadders(board), 1)
    }

}

private class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var cells = Array(repeating: (0, 0), count: n * n + 1)
        
        var label = 1
        
        var columns = Array(0 ..< n)
        
        for row in (0 ..< n).reversed() {
            for col in columns {
                cells[label] = (row, col)
                label += 1
            }
            columns.reverse()
        }
        
        var dist = Array(repeating: -1, count: n * n + 1)
        
        var queue = [Int]()
        
        dist[1] = 0
        
        queue.append(1)
        
        while queue.isEmpty == false {
            let current = queue.removeFirst()
            
            for next in current + 1 ..< min(current + 6, n * n) + 1 {
                let (row, col) = cells[next]
                let destination = board[row][col] != -1 ? board[row][col] : next
                if dist[destination] == -1 {
                    dist[destination] = dist[current] + 1
                    queue.append(destination)
                }
            }
        }
        
        return dist[n * n]
    }
}
