//
//  FinalPricesWithASpecialDiscountInAShop.swift
//  https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop/
//
//  Created by Erik Radicheski da Silva on 18/12/24.
//

import XCTest

final class FinalPricesWithASpecialDiscountInAShop: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.finalPrices([8, 4, 6, 2, 3]), [4, 2, 4, 2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.finalPrices([1, 2, 3, 4, 5]), [1, 2, 3, 4, 5])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.finalPrices([10, 1, 1, 6]), [9, 0, 1, 6])
    }
    
}

private class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        var prices = prices
        
        for (i, price) in prices.enumerated() {
            var discount: Int?
            
            var j = i + 1
            while j < prices.endIndex {
                if prices[j] <= prices[i] {
                    discount = prices[j]
                    break
                }
                
                j += 1
            }
            
            prices[i] -= discount ?? 0
        }
        
        return prices
    }
}
