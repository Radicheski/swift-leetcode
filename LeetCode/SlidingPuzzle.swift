//
//  SlidingPuzzle.swift
//  https://leetcode.com/problems/sliding-puzzle/
//
//  Created by Erik Radicheski da Silva on 25/11/24.
//

import XCTest

final class SlidingPuzzle: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.slidingPuzzle([[1, 2, 3], [4, 0, 5]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.slidingPuzzle([[1, 2, 3], [5, 4, 0]]), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.slidingPuzzle([[4, 1, 2], [5, 0, 3]]), 5)
    }
    
}

private class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        guard board != [[1, 2, 3], [4, 5, 0]] else { return 0 }
        
        let moves = [0: [1, 3], 1: [0, 2, 4], 2: [1, 5], 3: [0, 4], 4: [1, 3, 5], 5: [2, 4]]
        
        var seen = Set<[Int]>()
        var queue = [(moves: 0, board: board[0] + board[1])]
        
        while queue.isEmpty == false {
            let first = queue.removeFirst()
            
            let index = first.board.firstIndex(of: 0)!
            
            for move in moves[index, default: []] {
                var newBoard = first.board
                newBoard.swapAt(move, index)
                
                if newBoard == [1, 2, 3, 4, 5, 0] { return first.moves + 1 }
                
                if seen.contains(newBoard) { continue }
                seen.insert(newBoard)
                
                queue.append((first.moves + 1, newBoard))
            }
        }
        
        return -1
    }
}
