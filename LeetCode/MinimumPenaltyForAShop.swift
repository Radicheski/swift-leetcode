//
//  MinimumPenaltyForAShop.swift
//  https://leetcode.com/problems/minimum-penalty-for-a-shop/
//
//  Created by Erik Radicheski da Silva on 28/08/23.
//

import XCTest

final class MinimumPenaltyForAShop: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.bestClosingTime("YYNY"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.bestClosingTime("NNNNN"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.bestClosingTime("YYYY"), 4)
    }

}

private class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        let customers = Array(customers)
        
        var penalty = Array(repeating: 0, count: customers.count + 1)
        penalty[0] = customers.filter { $0 == "Y" }.count
        
        var minimumPenalty = penalty[0]
        var closeTime = 0
        
        for (i, customer) in customers.enumerated() {
            penalty[i + 1] = penalty[i]
            
            if customer == "Y" {
                penalty[i + 1] -= 1
            } else /* if customer == "N" */ {
                penalty[i + 1] += 1
            }
            
            if penalty[i + 1] < minimumPenalty {
                minimumPenalty = penalty[i + 1]
                closeTime = i + 1
            }
        }
        
        return closeTime
    }
}
