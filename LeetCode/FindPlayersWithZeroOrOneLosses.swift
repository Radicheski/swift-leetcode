//
//  FindPlayersWithZeroOrOneLosses.swift
//  https://leetcode.com/problems/find-players-with-zero-or-one-losses/
//
//  Created by Erik Radicheski da Silva on 15/01/24.
//

import XCTest

final class FindPlayersWithZeroOrOneLosses: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findWinners([[1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5], [4, 8],
                                             [4, 9], [10, 4], [10, 9]]), [[1, 2, 10], [4, 5, 7, 8]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findWinners([[2, 3], [1, 3], [5, 4], [6, 4]]), [[1, 2, 5, 6], []])
    }
    
}

private class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var players = Set<Int>()
        var defeats = [Int: Int]()
        
        for match in matches {
            players.formUnion(match)
            defeats[match[1], default: 0] += 1
        }
        
        var answer = Array(repeating: [Int](), count: 2)
        
        answer[0] = Array(players.subtracting(defeats.keys)).sorted()
        answer[1] = defeats.filter { $0.value == 1 }.keys.sorted()
        
        return answer
    }
}
