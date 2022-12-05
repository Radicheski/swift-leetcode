//
//  BestTimeToBuyAndSellStock2.swift
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
//
//  Created by Erik Radicheski da Silva on 05/12/22.
//

import XCTest

final class BestTimeToBuyAndSellStock2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProfit([7, 1, 5, 3, 6, 4]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProfit([1, 2, 3, 4, 5]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxProfit([7, 6, 4, 3, 1]), 0)
    }
}

private class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var sellPrice = Int.min
        var buyPrice = Int.max
        
        var profit = 0
        
        for price in prices.reversed() {
            if price > buyPrice {
                profit += max(sellPrice - buyPrice, 0)
                sellPrice = .min
                buyPrice = .max
            }
            
            sellPrice = max(sellPrice, price)
            buyPrice = min(buyPrice, price)
        }
        
        profit += max(sellPrice - buyPrice, 0)
        
        return profit
    }
}
