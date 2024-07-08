//
//  WaterBottles.swift
//  https://leetcode.com/problems/water-bottles/
//
//  Created by Erik Radicheski da Silva on 08/07/24.
//

import XCTest

final class WaterBottles: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numWaterBottles(9, 3), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numWaterBottles(15, 4), 19)
    }
    
}

private class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var emptyBottles = numBottles
        var totalBottles = numBottles
        
        while emptyBottles >= numExchange {
            totalBottles += (emptyBottles / numExchange)
            emptyBottles = (emptyBottles / numExchange) + (emptyBottles % numExchange)
        }
        
        return totalBottles
    }
}
