//
//  WordSearch.swift
//  https://leetcode.com/problems/word-search/
//
//  Created by Erik Radicheski da Silva on 29/10/22.
//

import XCTest

final class WordSearch: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let board: [[Character]] = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
        let word = "ABCCED"
        XCTAssertTrue(solution.exist(board, word))
    }
    
    func testExampleB() {
        let board: [[Character]] = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
        let word = "SEE"
        XCTAssertTrue(solution.exist(board, word))
    }
    
    func testExampleC() {
        let board: [[Character]] = [["A", "B", "C", "E"], ["S", "F", "C", "S"], ["A", "D", "E", "E"]]
        let word = "ABCB"
        XCTAssertFalse(solution.exist(board, word))
    }

}

private class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        let visited = board.map { $0.map { _ in false } }
        var origin: (x: Int, y: Int)
        
        for (x, row) in board.enumerated() {
            for (y, _) in row.enumerated() {
                origin = (x, y)
                
                if searchNext(board, visited, word, origin) { return true }
            }
        }

        return false
    }
    
    private func searchNext(_ board: [[Character]], _ visited: [[Bool]], _ word: [Character], _ point: (x: Int, y: Int)) -> Bool {
        guard word.isEmpty == false else { return true }
        guard (board.startIndex ..< board.endIndex).contains(point.x) else { return false }
        guard (board[0].startIndex ..< board[0].endIndex).contains(point.y) else { return false }
        guard visited[point.x][point.y] == false else { return false }
        guard board[point.x][point.y] == word[0] else { return false }
        
        var visited = visited
        visited[point.x][point.y] = true
        
        var newWord = word
        let _ = newWord.removeFirst()
        
        for direction in Direction.allCases {
            let nextPoint = direction.move(from: point)
            if searchNext(board, visited, newWord, nextPoint) { return true }
        }

        return false
    }
    
    private enum Direction: CaseIterable {
        case north, south, east, west
        
        private var dx: Int {
            switch self {
            case .north: return -1
            case .south: return 1
            case .east, .west: return 0
            }
        }
        
        private var dy: Int {
            switch self {
            case .north, .south: return 0
            case .east: return 1
            case .west: return -1
            }
        }
        
        func move(from point: (x: Int, y: Int)) -> (x: Int, y: Int) {
            return (point.x + dx, point.y + dy)
        }
    }
}
