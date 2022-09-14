//
//  RichestCustomerWealth.swift
//  https://leetcode.com/problems/richest-customer-wealth/
//
//  Created by Erik Radicheski da Silva on 15/08/22.
//

import XCTest

class RichestCustomerWealth: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let accounts = [[1, 2, 3], [3, 2, 1]]
        XCTAssertEqual(solution.maximumWealth(accounts), 6)
    }
    
    func tsetExampleB() {
        let accounts = [[1, 5], [7, 3], [3, 5]]
        XCTAssertEqual(solution.maximumWealth(accounts), 10)
    }
    
    func testExampleC() {
        let accounts = [[2, 8, 7], [7, 1, 3], [1, 9, 5]]
        XCTAssertEqual(solution.maximumWealth(accounts), 17)
    }

}

private class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result = [Int]()

        for customer in 0..<accounts.count {
            result.insert(0, at: customer)
            for account in 0..<accounts[customer].count {
                result[customer] += accounts[customer][account]
            }
        }

        return result.max() ?? 0
    }
}
