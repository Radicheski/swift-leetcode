//
//  ReducingDishes.swift
//  https://leetcode.com/problems/reducing-dishes/
//
//  Created by Erik Radicheski da Silva on 29/03/23.
//

import XCTest

final class ReducingDishes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSatisfaction([-1, -8, 0, 5, -9]), 14)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSatisfaction([4, 3, 2]), 20)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxSatisfaction([-1, -4, -5]), 0)
    }

}

private class Solution {
    func maxSatisfaction(_ satisfaction: [Int]) -> Int {
        let satisfaction = satisfaction.sorted(by: >)
        
        guard satisfaction[0] > 0 else { return 0 }
        
        var maximumSatisfaction = Int.min
        var score = 0
        
        for i in satisfaction.indices {
            for j in 0 ... i {
                score += satisfaction[j]
            }
            
            maximumSatisfaction = max(maximumSatisfaction, score)
        }

        return maximumSatisfaction
    }
}
