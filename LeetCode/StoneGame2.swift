//
//  StoneGame2.swift
//  https://leetcode.com/problems/stone-game-ii/
//
//  Created by Erik Radicheski da Silva on 26/05/23.
//

import XCTest

final class StoneGame2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.stoneGameII([2, 7, 9, 4, 4]), 10)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.stoneGameII([1, 2, 3, 4, 5, 100]), 104)
    }
}

private class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        
        var dp = (0 ... 1).map { _ in
            (0 ... piles.endIndex).map { _ in
                (0 ... piles.endIndex).map { _ in -1 }
            }
        }
        
        return alicesScore(piles, &dp, 0, 0, 1)
    }
    
    private func alicesScore(_ piles: [Int], _ dp: inout [[[Int]]], _ p: Int, _ i: Int, _ m: Int) -> Int {
        guard i < piles.count else { return 0 }
        guard dp[p][i][m] == -1 else { return dp[p][i][m] }
        
        var res = p == 1 ? 1000000 : -1
        var s = 0
        
        for x in 1 ... min(2 * m, piles.count - i) {
            s += piles[i + x - 1];
            
            var nextScore = alicesScore(piles, &dp, 1 - p, i + x, max(m, x))
            nextScore += p == 0 ? s : 0
            
            if p == 0 {
                res = max(res, nextScore);
            } else {
                res = min(res, nextScore);
            }
        }
        
        dp[p][i][m] = res
        return res
    }
}
