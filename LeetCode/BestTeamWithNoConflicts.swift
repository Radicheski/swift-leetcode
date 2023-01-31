//
//  BestTeamWithNoConflicts.swift
//  https://leetcode.com/problems/best-team-with-no-conflicts/
//
//  Created by Erik Radicheski da Silva on 31/01/23.
//

import XCTest

final class BestTeamWithNoConflicts: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.bestTeamScore([1, 3, 5, 10, 15], [1, 2, 3, 4, 5]), 34)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.bestTeamScore([4, 5, 6, 5], [2, 1, 2, 1]), 16)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.bestTeamScore([1, 2, 3, 5], [8, 9, 10, 1]), 6)
    }

}

private class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        var players: [(score: Int, age: Int)] = scores.indices.map { ( scores[$0], ages[$0] ) }
        players.sort { $0.age == $1.age ? $0.score < $1.score : $0.age < $1.age }
        
        var dp: [[Int?]] = scores.map { _ in scores.map { _ in nil } }
        
        return findMaxScore(&dp, players, -1, 0)
    }
    
    private func findMaxScore(_ dp: inout [[Int?]], _ players: [(score: Int, age: Int)], _ previous: Int, _ current: Int) -> Int {
        guard players.indices.contains(current) else { return 0 }
        
        if let score = dp[previous + 1][current] {
            return score
        }
        
        if previous == -1 || players[current].score >= players[previous].score {
            let score = max(
                findMaxScore(&dp, players, previous, current + 1),
                players[current].score + findMaxScore(&dp, players, current, current + 1)
            )
            
            dp[previous + 1][current] = score
            
            return score
        }
        
        let score = findMaxScore(&dp, players, previous, current + 1)
        
        dp[previous + 1][current] = score
        
        return score
    }
}
