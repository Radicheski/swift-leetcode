//
//  KnightProbabilityInChessboard.swift
//  https://leetcode.com/problems/knight-probability-in-chessboard/
//
//  Created by Erik Radicheski da Silva on 22/07/23.
//

import XCTest

final class KnightProbabilityInChessboard: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.knightProbability(3, 2, 0, 0), 0.0625)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.knightProbability(1, 0, 0, 0), 1)
    }

}

private class Solution {
    
    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        guard k > 0 else { return 1 }
        
        let directions: [(dx: Int, dy: Int)] = [(-2, -1), (-2, 1), (2, -1), (2, 1),
                                                (-1, -2), (-1, 2), (1, -2), (1, 2)]
        
        var dp = Array(repeating: Array(repeating: Array(repeating: 0.0, count: n), count: n), count: k + 1)
        dp[0][row][column] = 1
        
        for moves in 1 ... k {
            for i in 0 ..< n {
                for j in 0 ..< n {
                    for direction in directions {
                        let previousI = i - direction.dx
                        let previousJ = j - direction.dy
                        
                        if (0 ..< n).contains(previousI) && (0 ..< n).contains(previousJ) {
                            dp[moves][i][j] += dp[moves - 1][previousI][previousJ] / 8
                        }
                    }
                }
            }
        }
        
        var answer = 0.0
        for i in 0 ..< n {
            for j in 0 ..< n {
                answer += dp[k][i][j]
            }
        }
        
        return answer
    }
    
}
