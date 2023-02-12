//
//  MinimumFuelCostToReportToTheCapital.swift
//  https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital/
//
//  Created by Erik Radicheski da Silva on 12/02/23.
//

import XCTest

final class MinimumFuelCostToReportToTheCapital: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumFuelCost([[0, 1], [0, 2], [0, 3]], 5), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumFuelCost([[3, 1], [3, 2], [1, 0], [0, 4], [0, 5], [4, 6]], 2), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumFuelCost([], 1), 0)
    }

}

private class Solution {
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        var adj = [Int: [Int]]()
        
        for road in roads {
            adj[road[0], default: []].append(road[1])
            adj[road[1], default: []].append(road[0])
        }
        
        var fuelCost = 0
        let _ = depthFirst(0, -1, adj, seats, &fuelCost)
        
        return fuelCost
    }
    
    private func depthFirst(_ node: Int, _ parent: Int, _ adj: [Int: [Int]], _ seats: Int, _ fuel: inout Int) -> Int {
        var representatives = 1
        
        guard let children = adj[node] else { return representatives }
        
        for child in children where child != parent {
            representatives += depthFirst(child, node, adj, seats, &fuel)
        }
        
        if node != 0 {
            fuel += representatives / seats
            fuel += representatives.isMultiple(of: seats) ? 0 : 1
        }
        
        return representatives
    }
}
