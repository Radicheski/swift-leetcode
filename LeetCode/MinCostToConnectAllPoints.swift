//
//  MinCostToConnectAllPoints.swift
//  https://leetcode.com/problems/min-cost-to-connect-all-points/
//
//  Created by Erik Radicheski da Silva on 15/09/23.
//

import XCTest

final class MinCostToConnectAllPoints: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minCostConnectPoints([[0, 0], [2, 2], [3, 10], [5, 2], [7, 0]]), 20)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minCostConnectPoints([[3, 12], [-2, 5], [-4, 1]]), 18)
    }
    
}

private class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var points = points
        
        var dist = Array(repeating: Int.max, count: points.count)
        var totalCost = 0
        
        for i in 0 ..< points.count - 1 {
            for j in i + 1 ..< points.count {
                dist[j] = min(dist[j], getDistance(points[i], points[j]))
                
                if dist[j] < dist[i + 1] {
                    points.swapAt(j, i + 1)
                    dist.swapAt(j, i + 1)
                }
            }
            
        }
        
        return dist[1...].reduce(into: 0, +=)
    }
    
    private func getDistance(_ pointA: [Int], _ pointB: [Int]) -> Int {
        abs(pointA[0] - pointB[0]) + abs(pointA[1] - pointB[1])
    }
}
