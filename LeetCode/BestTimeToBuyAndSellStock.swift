//
//  BestTimeToBuyAndSellStock.swift
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
//
//  Created by Erik Radicheski da Silva on 20/08/22.
//

import XCTest

class BestTimeToBuyAndSellStock: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProfit([7, 1, 5, 3, 6, 4]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProfit([7, 6, 4, 3, 1]), 0)
    }

}

private class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buyPrice = 1000000 // Greater than maximum input value
        var sellPrice = -1 // Lesser than minimum input value
        
        var result = 0
        
        for element in prices {
            if element < buyPrice {
                buyPrice = element
                sellPrice = -1
            } else if element > sellPrice {
                sellPrice = element
            }
            
            result = max(result, sellPrice - buyPrice)
        }
        
        return result
    }
}
