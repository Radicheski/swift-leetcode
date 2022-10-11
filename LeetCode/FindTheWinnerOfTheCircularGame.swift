//
//  FindTheWinnerOfTheCircularGame.swift
//  https://leetcode.com/problems/find-the-winner-of-the-circular-game/
//
//  Created by Erik Radicheski da Silva on 11/10/22.
//

import XCTest

final class FindTheWinnerOfTheCircularGame: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findTheWinner(5, 2), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findTheWinner(6, 5), 1)
    }
    
}

private class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var friends = Array(1 ... n)
        
        var position = 0
        
        while friends.count > 1 {
            position += k - 1
            position %= friends.count
            let _ = friends.remove(at: position)
        }
        
        return friends[0]
    }
}
