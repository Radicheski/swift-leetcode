//
//  NumberOfWaysToArriveAtDestination.swift
//  https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/
//
//  Created by Erik Radicheski da Silva on 23/03/25.
//

import XCTest

final class NumberOfWaysToArriveAtDestination: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countPaths(7, [[0, 6, 7], [0, 1, 2], [1, 2, 3], [1, 3, 3], [6, 3, 3], [3, 5, 1], [6, 5, 1], [2, 5, 1], [0, 4, 5], [4, 6, 2]]), 4)
    }

    func testExampleB() {
        XCTAssertEqual(solution.countPaths(2, [[1, 0, 10]]), 1)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
        var graph = [Int: [(node: Int, time: Int)]]()
        
        for road in roads {
            graph[road[0], default: []].append((road[1], road[2]))
            graph[road[1], default: []].append((road[0], road[2]))
        }
        
        var minHeap = [(node: Int, time: Int)]()
        var shortestTime = Array(repeating: Int.max, count: n)
        var pathCount = Array(repeating: 0, count: n)
        shortestTime[0] = 0
        pathCount[0] = 1
        
        minHeap.append((0, 0))
        
        while let (node, time) = minHeap.popLast() {
            if time > shortestTime[node] { continue }
            
            for (neighborNode, neighborTime) in graph[node, default: []] {
                if time + neighborTime  < shortestTime[neighborNode] {
                    shortestTime[neighborNode] = time + neighborTime
                    pathCount[neighborNode] = pathCount[node]
                    insert(&minHeap, (neighborNode, shortestTime[neighborNode]))
                } else if time + neighborTime == shortestTime[neighborNode] {
                    pathCount[neighborNode] += pathCount[node]
                    pathCount[neighborNode] %= mod
                }
            }
        }
        
        return pathCount[n - 1]
    }
    
    private func insert(_ queue: inout [(node: Int, time: Int)], _ element: (node: Int, time: Int)) {
        if queue.isEmpty {
            queue.append(element)
            return
        }
        
        if queue[0].time <= element.time {
            queue.insert(element, at: 0)
            return
        }
        
        if queue.last!.time >= element.time {
            queue.append(element)
            return
        }
        
        var left = 0
        var right = queue.count
        
        while left < right {
            let mid = (left + right) / 2
            if queue[mid].time >= element.time {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        queue.insert(element, at: left)
    }
}
