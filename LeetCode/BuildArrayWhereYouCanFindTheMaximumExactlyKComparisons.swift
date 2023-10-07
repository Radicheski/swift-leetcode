//
//  BuildArrayWhereYouCanFindTheMaximumExactlyKComparisons.swift
//  https://leetcode.com/problems/build-array-where-you-can-find-the-maximum-exactly-k-comparisons/
//
//  Created by Erik Radicheski da Silva on 07/10/23.
//

import XCTest

final class BuildArrayWhereYouCanFindTheMaximumExactlyKComparisons: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numOfArrays(2, 3, 1), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numOfArrays(5, 2, 3), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numOfArrays(9, 1, 1), 1)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        var dp = (0 ... n).map { _ in
            (0 ... k).map { _ in
                (0 ... m).map { _ in 0 }
            }
        }
        
        dp[1][1] = Array(repeating: 1, count: m + 1)
        
        for N in 1 ... n {
            for K in 1 ... k {
                for M in 1 ... m {
                    var sum = M * dp[N - 1][K][M] % mod
                    
                    for i in 1 ..< M {
                        sum += dp[N - 1][K - 1][i] % mod
                        sum %= mod
                    }
                    
                    dp[N][K][M] += sum
                    dp[N][K][M] %= mod
                }
            }
        }
        
        var answer = 0
        for i in 1 ... m {
            answer += dp[n][k][i]
            answer %= mod
        }
        
        return answer
    }
}
