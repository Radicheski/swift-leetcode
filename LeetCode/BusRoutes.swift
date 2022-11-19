//
//  BusRoutes.swift
//  https://leetcode.com/problems/bus-routes/
//
//  Created by Erik Radicheski da Silva on 19/11/22.
//

import XCTest

final class BusRoutes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numBusesToDestination([[1, 2, 7], [3, 6, 7]], 1, 6), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numBusesToDestination([[7, 12], [4, 5, 15], [6], [15, 19], [9, 12, 13]], 15, 12), -1)
    }

}

private class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        guard source != target else { return 0 }
        
        var map = [Int: [Int]]()
        
        for (i, routeI) in routes.enumerated() {
            for route in routeI  {
                map[route, default: []].append(i)
            }
        }
        
        var queue = [source]
        
        var visited = Set<Int>()
        
        for level in 1 ..< .max {
            guard queue.isEmpty == false else { break }
            var size = queue.count
            
            for _ in 0 ..< size {
                var node = queue.removeFirst()
                
                for i in 0 ..< (map[node]?.count ?? 0) {
                    if var route = map[node]?[i] {
                        guard visited.contains(route) == false else { continue }
                        visited.insert(route)
                        for j in 0 ..< routes[route].count {
                            var stop = routes[route][j]
                            if stop == target { return level }
                            queue.append(stop)
                        }
                    }
                }
            }
            
            
        }
        
        return -1
    }
}
