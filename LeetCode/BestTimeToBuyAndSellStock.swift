//
//  BestTimeToBuyAndSellStock.swift
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock
//
//  Created by Erik Radicheski da Silva on 20/08/22.
//

import XCTest

class BestTimeToBuyAndSellStock: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.maxProfit([7, 1, 5, 3, 6, 4]), 5)
        XCTAssertEqual(solution.maxProfit([7, 6, 4, 3, 1]), 0)
    }

}

private class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let prices = prices.enumerated().sorted { $0.element < $1.element }
        let reversedPrices = prices.reversed()
        var profit = 0
        
        for element in prices {
            let buyPrice = element.element
            
            for reverseElement in reversedPrices {
                if reverseElement.offset < element.offset {
                    continue
                } else if reverseElement.offset == element.offset {
                    break
                } else if reverseElement.offset > element.offset {
                    let sellPrice = reverseElement.element
                    profit = max(profit, sellPrice - buyPrice)
                    break
                }
            }
        }
        
        return profit
    }
}
