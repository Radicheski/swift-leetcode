//
//  BestTimeToBuyAndSellStockWithCooldown.swift
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/
//
//  Created by Erik Radicheski da Silva on 06/12/22.
//

import XCTest

final class BestTimeToBuyAndSellStockWithCooldown: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProfit([1, 2, 3, 0, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProfit([1]), 0)
    }

}

private class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var lastBuy = -prices[0]
        var nextToLastBuy = lastBuy
        
        var lastSell = 0
        var nextToLastSell = 0
        var secondToLastSell = 0
        
        for price in prices[1...] {
            lastBuy = max(nextToLastBuy, secondToLastSell - price)
            lastSell = max(nextToLastSell, nextToLastBuy + price)
            
            nextToLastBuy = lastBuy
            secondToLastSell = nextToLastSell
            nextToLastSell = lastSell
        }
        
        return lastSell
    }
}
