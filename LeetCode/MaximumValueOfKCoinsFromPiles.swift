//
//  MaximumValueOfKCoinsFromPiles.swift
//  https://leetcode.com/problems/maximum-value-of-k-coins-from-piles/
//
//  Created by Erik Radicheski da Silva on 15/04/23.
//

import XCTest

final class MaximumValueOfKCoinsFromPiles: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxValueOfCoins([[1, 100, 3], [7, 8, 9]], 2), 101)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxValueOfCoins([[100], [100], [100], [100], [100], [100],
                                                 [1, 1, 1, 1, 1, 1, 700]], 7), 706)
    }

}

private class Solution {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: piles.count + 1)
        
        for i in 1 ... piles.count {
            for coins in 0 ... k {
                var currentSum = 0
                
                for currentCoins in 0 ... min(piles[i - 1].count, coins) {
                    if currentCoins > 0 {
                        currentSum += piles[i - 1][currentCoins - 1]
                    }
                    dp[i][coins] = max(dp[i][coins], dp[i - 1][coins - currentCoins] + currentSum)
                }
            }
        }
        
        return dp[piles.count][k]
    }
}
