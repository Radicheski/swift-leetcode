//
//  RelativeRanks.swift
//  https://leetcode.com/problems/relative-ranks/
//
//  Created by Erik Radicheski da Silva on 08/05/24.
//

import XCTest

final class RelativeRanks: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findRelativeRanks([5, 4, 3, 2, 1]),
                       ["Gold Medal", "Silver Medal", "Bronze Medal", "4", "5"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findRelativeRanks([10, 3, 8, 9, 4]),
                       ["Gold Medal", "5", "Bronze Medal", "Silver Medal", "4"])
    }
    
}

private class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        var rankedPlayers = score.enumerated().sorted { $0.element > $1.element }.map(\.offset)
        
        var answer = Array(repeating: "", count: score.count)
        
        for (rank, player) in rankedPlayers.enumerated() {
            switch rank {
            case 0: answer[player] = "Gold Medal"
            case 1: answer[player] = "Silver Medal"
            case 2: answer[player] = "Bronze Medal"
            default: answer[player] = "\(rank + 1)"
            }
        }
        
        
        return answer
    }
}
