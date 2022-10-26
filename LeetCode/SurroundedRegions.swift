//
//  SurroundedRegions.swift
//  https://leetcode.com/problems/surrounded-regions/
//
//  Created by Erik Radicheski da Silva on 26/10/22.
//

import XCTest

final class SurroundedRegions: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        var input: [[Character]] = [["X", "X", "X", "X"], ["X", "O", "O", "X"],
                                    ["X", "X", "O", "X"], ["X", "O", "X", "X"]]
        solution.solve(&input)
        XCTAssertEqual(input, [["X", "X", "X", "X"], ["X", "X", "X", "X"],
                               ["X", "X", "X", "X"], ["X", "O", "X", "X"]])
    }
    
    func testExampleB() {
        var input: [[Character]] = [["X"]]
        solution.solve(&input)
        XCTAssertEqual(input, [["X"]])
    }

}

private class Solution {
    func solve(_ board: inout [[Character]]) {
        guard board.count > 1 && board[0].count > 1 else { return }
        
        var visited = board.map { $0.map { $0 == "X" } }
        
        let maxX = board.endIndex - 1
        let maxY = board[maxX].endIndex - 1
        
        for x in 0 ... maxX {
            search(board, &visited, x, 0)
            search(board, &visited, x, maxY)
        }
        
        for y in 0 ... maxY {
            search(board, &visited, 0, y)
            search(board, &visited, maxX, y)
        }
        
        for x in 0 ..< board.endIndex {
            for y in 0 ..< board[x].endIndex {
                if visited[x][y] { continue }
                board[x][y] = "X"
            }
        }
        
    }
    
    private func search(_ board: [[Character]], _ visited: inout [[Bool]], _ x: Int, _ y: Int) {
        guard (0 ..< board.endIndex).contains(x) else { return }
        guard (0 ..< board[0].endIndex).contains(y) else { return }
        guard visited[x][y] == false else { return }
        
        visited[x][y] = true
        
        guard board[x][y] == "O" else { return }
        
        search(board, &visited, x - 1, y)
        search(board, &visited, x + 1, y)
        search(board, &visited, x, y - 1)
        search(board, &visited, x, y + 1)
    }
}
