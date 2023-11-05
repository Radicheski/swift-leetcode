//
//  FindTheWinnerOfAnArrayGame.swift
//  https://leetcode.com/problems/find-the-winner-of-an-array-game/
//
//  Created by Erik Radicheski da Silva on 05/11/23.
//

import XCTest

final class FindTheWinnerOfAnArrayGame: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getWinner([2, 1, 3, 5, 4, 6, 7], 2), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getWinner([3, 2, 1], 10), 3)
    }

}

private class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var winnerIndex = 0
        var victories = 0
        
        var opponentIndex = 1
        
        while arr.indices.contains(opponentIndex) {
            guard victories < k else { break }
            
            if arr[winnerIndex] > arr[opponentIndex] {
                victories += 1
                opponentIndex += 1
            } else {
                winnerIndex = opponentIndex
                victories = 1
                opponentIndex += 1
            }
        }
        
        return arr[winnerIndex]
    }
}
