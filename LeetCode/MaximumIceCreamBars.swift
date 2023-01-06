//
//  MaximumIceCreamBars.swift
//  https://leetcode.com/problems/maximum-ice-cream-bars/
//
//  Created by Erik Radicheski da Silva on 06/01/23.
//

import XCTest

final class MaximumIceCreamBars: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxIceCream([1, 3, 2, 4, 1], 7), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxIceCream([10, 6, 8, 7, 7, 8], 5), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxIceCream([1, 6, 3, 1, 2, 5], 20), 6)
    }

}

private class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        let costs = costs.filter { $0 <= coins }.sorted()
        
        guard costs.isEmpty == false else { return 0 }
        
        var result = 0
        var total = 0
        
        for cost in costs {
            if cost <= coins - total {
                total += cost
                result += 1
            } else {
                break
            }
        }
        
        return result
    }
}
