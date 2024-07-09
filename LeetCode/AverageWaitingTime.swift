//
//  AverageWaitingTime.swift
//  https://leetcode.com/problems/average-waiting-time/
//
//  Created by Erik Radicheski da Silva on 09/07/24.
//

import XCTest

final class AverageWaitingTime: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.averageWaitingTime([[1, 2], [2, 5], [4, 3]]), 5, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.averageWaitingTime([[5, 2], [5, 4], [10, 3], [20, 1]]), 3.25, accuracy: 1e-5)
    }
    
}

private class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var timeIdle = 0
        var totalWaiting = 0
        
        for customer in customers {
            if customer[0] > timeIdle {
                totalWaiting += customer[1]
                timeIdle = customer[0] + customer[1]
            } else {
                timeIdle += customer[1]
                totalWaiting += timeIdle - customer[0]
            }
        }
        
        return Double(totalWaiting) / Double(customers.count)
    }
}
