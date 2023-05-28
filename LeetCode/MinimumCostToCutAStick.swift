//
//  MinimumCostToCutAStick.swift
//  https://leetcode.com/problems/minimum-cost-to-cut-a-stick/
//
//  Created by Erik Radicheski da Silva on 28/05/23.
//

import XCTest

final class MinimumCostToCutAStick: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCost(7, [1, 3, 4, 5]), 16)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCost(9, [5, 6, 1, 4, 2]), 22)
    }
    
}

private class Solution {
    func minCost(_ n: Int, _ cuts: [Int]) -> Int {
        var cuts = cuts + [0, n]
        cuts.sort()
        
        var costs: [[Int]] = cuts.map { _ in
            cuts.map { _ in .max }
        }
        
        for i in 1 ..< cuts.endIndex {
            costs[i - 1][i] = 0
        }
        
        return cost(cuts, 0, cuts.endIndex - 1, &costs)
    }
    
    private func cost(_ cuts: [Int], _ left: Int, _ right: Int, _ costs: inout [[Int]]) -> Int {
        guard costs[left][right] == .max else { return costs[left][right] }
        
        var minimumNextCost = Int.max
        
        for i in left + 1 ..< right {
            minimumNextCost = min(minimumNextCost, cost(cuts, left, i, &costs) + cost(cuts, i, right, &costs))
        }
        
        let cost = minimumNextCost + cuts[right] - cuts[left]
        costs[left][right] = cost
        return cost
    }
}
