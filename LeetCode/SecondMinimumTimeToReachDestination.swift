//
//  SecondMinimumTimeToReachDestination.swift
//  https://leetcode.com/problems/second-minimum-time-to-reach-destination/
//
//  Created by Erik Radicheski da Silva on 28/07/24.
//

import XCTest

final class SecondMinimumTimeToReachDestination: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.secondMinimum(5, [[1, 2], [1, 3], [1, 4], [3, 4], [4, 5]], 3, 5), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.secondMinimum(2, [[1, 2]], 3, 2), 11)
    }
    
}

private class Solution {
    func secondMinimum(_ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int) -> Int {
        var adj = [Int: [Int]]()
        
        for edge in edges {
            adj[edge[0], default: []].append(edge[1])
            adj[edge[1], default: []].append(edge[0])
        }
        
        var dist: [[Int?]] = Array(repeating: Array(repeating: nil, count: n + 1), count: 3)
        
        var queue = [(node: 1, frequency: 1)]
        dist[1][1] = 0
        
        while queue.isEmpty == false {
            let (node, frequency) = queue.removeFirst()
            
            var timeTaken = dist[frequency][node]!
            
            if (timeTaken / change).isMultiple(of: 2) {
                timeTaken += time
            } else {
                timeTaken = change * (timeTaken / change + 1) + time
            }
            
            guard let neighbors = adj[node] else { continue }
            
            for neighbor in neighbors {
                if dist[1][neighbor] == nil {
                    dist[1][neighbor] = timeTaken
                    queue.append((neighbor, 1))
                } else if dist[2][neighbor] == nil && dist[1][neighbor] != timeTaken {
                    guard neighbor != n else { return timeTaken }
                    dist[2][neighbor] = timeTaken
                    queue.append((neighbor, 2))
                }
            }
            
        }
        
        return 0
    }
}
