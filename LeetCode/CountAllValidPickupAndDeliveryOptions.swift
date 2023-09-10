//
//  CountAllValidPickupAndDeliveryOptions.swift
//  https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/
//
//  Created by Erik Radicheski da Silva on 10/09/23.
//

import XCTest

final class CountAllValidPickupAndDeliveryOptions: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countOrders(1), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countOrders(2), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countOrders(3), 90)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countOrders(_ n: Int) -> Int {
        var answer = 1
        
        for i in 1 ... n {
            answer *= i * (2 * i - 1)
            answer %= mod
        }
        
        return answer
    }
}
