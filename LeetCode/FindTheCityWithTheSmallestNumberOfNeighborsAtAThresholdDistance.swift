//
//  FindTheCityWithTheSmallestNumberOfNeighborsAtAThresholdDistance.swift
//  https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/
//
//  Created by Erik Radicheski da Silva on 26/07/24.
//

import XCTest

final class FindTheCityWithTheSmallestNumberOfNeighborsAtAThresholdDistance: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findTheCity(4, [[0, 1, 3], [1, 2, 1], [1, 3, 4], [2, 3, 1]], 4), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findTheCity(5, [[0, 1, 2], [0, 4, 8], [1, 2, 3], [1, 4, 2], [2, 3, 1], [3, 4, 1]], 2), 0)
    }
    
}

private class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var neighbors = Array(repeating: [[Int]](), count: n)
        var shortestPath = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        for i in 0 ..< n {
            shortestPath[i][i] = 0
        }
        
        for edge in edges {
            neighbors[edge[0]].append([edge[1], edge[2]])
            neighbors[edge[1]].append([edge[0], edge[2]])
        }
        
        for i in 0 ..< n {
            shortestPathFirst(n, neighbors, &shortestPath[i], i)
        }
        
        return getFewestReachable(n, shortestPath, distanceThreshold)
    }
    
    func shortestPathFirst(_ n: Int, _ neighbors: [[[Int]]], _ shortestPath: inout [Int], _ source: Int) {
        var queue = [source]
        var update = Array(repeating: 0, count: n)
        
        shortestPath.indices.forEach { shortestPath[$0] = ($0 == source) ? 0 : Int.max }
        
        while queue.isEmpty == false {
            let currentCity = queue.removeFirst()
            
            for neighbor in neighbors[currentCity] {
                let city = neighbor[0]
                let weight = neighbor[1]
                
                if shortestPath[city] > shortestPath[currentCity] + weight {
                    shortestPath[city] = shortestPath[currentCity] + weight
                    update[city] += 1
                    queue.append(city)
                }
            }
        }
    }
    
    func getFewestReachable(_ n: Int, _ shortestPath: [[Int]], _ distanceThreshold: Int) -> Int {
        var city = -1
        var count = n
        
        for i in 0 ..< n {
            var reachable = 0
            
            for j in 0 ..< n where i != j {
                if shortestPath[i][j] <= distanceThreshold {
                    reachable += 1
                }
            }
            
            if reachable <= count {
                count = reachable
                city = i
            }
        }
        
        return city
    }
    
}
