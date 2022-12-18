//
//  CoinChange2.swift
//  https://leetcode.com/problems/coin-change-ii/
//
//  Created by Erik Radicheski da Silva on 18/12/22.
//

import XCTest

final class CoinChange2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.change(5, [1, 2, 5]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.change(3, [2]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.change(10, [10]), 1)
    }
    
}

private class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins where coin <= amount {
            for i in coin ... amount {
                if i >= coin {
                    dp[i] += dp[i - coin]
                }
            }
        }
        return dp[amount]
    }
}
