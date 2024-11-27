//
//  ShortestDistanceAfterRoadAdditionQueries1.swift
//  https://leetcode.com/problems/shortest-distance-after-road-addition-queries-i/
//
//  Created by Erik Radicheski da Silva on 27/11/24.
//

import XCTest

final class ShortestDistanceAfterRoadAdditionQueries1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestDistanceAfterQueries(5, [[2, 4], [0, 2], [0, 4]]), [3, 2, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestDistanceAfterQueries(4, [[0, 3], [0, 2]]),  [1, 1])
    }
    
}

private class Solution {
    func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        var roads = [Int: [Int]]()
        
        for i in 0 ..< n - 1 {
            roads[i, default: []].append(i + 1)
        }
        
        var distances = [Int]()
        
        for query in queries {
            roads[query[0], default: []].append(query[1])
            
            var queue = [(city: 0, distance: 0)]
            var visited = Set<Int>()
            
            while queue.isEmpty == false {
                let (city, distance) = queue.removeFirst()
                
                if city == n - 1 {
                    distances.append(distance)
                    break
                }
                
                for road in roads[city, default: []] where visited.contains(road) == false {
                    queue.append((road, distance + 1))
                }
        
                visited.insert(city)
            }
        }
        
        return distances
    }
}
