//
//  BestTimeToBuyAndSellStockWithTransactionFee.swift
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/
//
//  Created by Erik Radicheski da Silva on 06/12/22.
//

import XCTest

final class BestTimeToBuyAndSellStockWithTransactionFee: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProfit([1, 3, 2, 8, 4, 9], 2), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProfit([1, 3, 7, 5, 10, 3], 3), 6)
    }

}

private class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var cash = 0
        var hold = -prices[0]
        
        for price in prices[1...] {
            cash = max(cash, hold + price - fee)
            hold = max(hold, cash - price)
        }
        
        return cash
    }
}
