//
//  MinimumDifficultyOfAJobSchedule.swift
//  https://leetcode.com/problems/minimum-difficulty-of-a-job-schedule/
//
//  Created by Erik Radicheski da Silva on 29/12/23.
//

import XCTest

final class MinimumDifficultyOfAJobSchedule: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDifficulty([6, 5, 4, 3, 2, 1], 2), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDifficulty([9, 9, 9], 4), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minDifficulty([1, 1, 1], 3), 3)
    }
    
}

private class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        let n = jobDifficulty.count
        
        guard n >= d else { return -1 }
        
        var F = Array(repeating: Array(repeating: 0, count: n + 1), count: d + 1)
        
        for i in 1 ... n {
            F[1][i] = max(F[1][i - 1], jobDifficulty[i - 1])
        }
        
        if d > 1 {
            for i in 2 ... d {
                for j in i ... n {
                    F[i][j] = .max
                    var currMax = 0
                    
                    for k in stride(from: j, through: i, by: -1) {
                        currMax = max(currMax, jobDifficulty[k - 1]);
                        F[i][j] = min(F[i][j], F[i - 1][k - 1] + currMax);
                    }
                }
            }
        }
        
        return F[d][n];
    }
}
