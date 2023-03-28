//
//  MinimumCostForTickets.swift
//  https://leetcode.com/problems/minimum-cost-for-tickets/
//
//  Created by Erik Radicheski da Silva on 28/03/23.
//

import XCTest

final class MinimumCostForTickets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mincostTickets([1, 4, 6, 7, 8, 20], [2, 7, 15]), 11)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mincostTickets([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15]), 17)
    }

}

private class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var results = Array(repeating: Int.max, count: 366)
        return dp(1, Set(days), costs, &results)
    }
    
    private func dp(_ day: Int, _ days: Set<Int>, _ costs: [Int], _ results: inout [Int]) -> Int {
        guard day < 366 else { return 0 }
        
        guard results[day] == .max else { return results[day] }
        
        results[day] = dp(day + 1, days, costs, &results)
        
        if days.contains(day) {
            results[day] += costs[0]
            results[day] = min(results[day], dp(day + 7, days, costs, &results) + costs[1])
            results[day] = min(results[day], dp(day + 30, days, costs, &results) + costs[2])
        }
        
        return results[day]
    }
}
