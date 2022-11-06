//
//  CoinChange.swift
//  https://leetcode.com/problems/coin-change/
//
//  Created by Erik Radicheski da Silva on 05/11/22.
//

import XCTest

final class CoinChange: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.coinChange([1, 2, 5], 11), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.coinChange([2], 3), -1)
    }
    
    func testExamplC() {
        XCTAssertEqual(solution.coinChange([1], 0), 0)
    }

}

private class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var result = Array(repeating: Int.max, count: amount + 1)
        result[0] = 0
        
        let coins = coins.sorted(by: <)
        
        for i in 1 ... amount {
            for coin in coins {
                if i < coin { break }
                
                if result[i - coin] != .max {
                    result[i] = min(result[i], 1 + result[i - coin])
                }
            }
        }
        
        return result[amount] == .max ? -1 : result[amount]
    }
}
