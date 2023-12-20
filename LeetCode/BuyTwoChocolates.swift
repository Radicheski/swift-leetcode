//
//  BuyTwoChocolates.swift
//  https://leetcode.com/problems/
//
//  Created by Erik Radicheski da Silva on 20/12/23.
//

import XCTest

final class BuyTwoChocolates: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.buyChoco([1, 2, 2], 3), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.buyChoco([3, 2, 3], 3), 3)
    }
    
}

private class Solution {
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        let prices = prices.sorted()
        
        return prices[0] + prices[1] <= money ? money - prices[0] - prices[1] : money
    }
}
