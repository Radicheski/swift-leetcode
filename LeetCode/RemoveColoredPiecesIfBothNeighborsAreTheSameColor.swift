//
//  RemoveColoredPiecesIfBothNeighborsAreTheSameColor.swift
//  https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color/
//
//  Created by Erik Radicheski da Silva on 02/10/23.
//

import XCTest

final class RemoveColoredPiecesIfBothNeighborsAreTheSameColor: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.winnerOfGame("AAABABB"))
    }
    
    
    func testExampleB() {
        XCTAssertFalse(solution.winnerOfGame("AA"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.winnerOfGame("ABBBBBBBAAA"))
    }

}

private class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        let colors = Array(colors)
        
        guard colors.count > 2 else { return false }
        
        var moves = [0, 0]
        
        for i in 1 ..< colors.endIndex - 1 {
            if colors[i - 1] == colors[i] && colors[i] == colors[i + 1] {
                if colors[i] == "A" {
                    moves[0] += 1
                } else {
                    moves[1] += 1
                }
            }
        }
        
    
        return moves[0] > moves[1]
    }
}
