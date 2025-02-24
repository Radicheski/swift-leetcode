//
//  MostProfitablePathInATree.swift
//  https://leetcode.com/problems/most-profitable-path-in-a-tree/
//
//  Created by Erik Radicheski da Silva on 24/02/25.
//

import XCTest

final class MostProfitablePathInATree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mostProfitablePath([[0, 1], [1, 2], [1, 3], [3, 4]], 3, [-2, 4, 2, -4, 6]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mostProfitablePath([[0, 1]], 1, [-7280, 2350]), -7280)
    }
    
}

private class Solution {
    func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
        var path = [Int: [Int]]()
        
        for edge in edges {
            path[edge[0], default: []].append(edge[1])
            path[edge[1], default: []].append(edge[0])
        }
        
        var treeDistances = Array(repeating: 0, count: amount.count)
        
        var queue = [0]
        var visited = Array(repeating: false, count: amount.count)
        
        while let node = queue.popLast() {
            visited[node] = true
            
            for nextNode in path[node] ?? [] {
                if visited[nextNode] { continue }
                
                queue.append(nextNode)
                treeDistances[nextNode] = treeDistances[node] + 1
            }
        }
        
        var bobPath = [bob]
        queue = [bob]
        
        while let node = queue.popLast() {
            for nextNode in path[node] ?? [] {
                if treeDistances[nextNode] < treeDistances[node] {
                    bobPath.append(nextNode)
                    queue.append(nextNode)
                }
            }
        }
        
        var bobPathTime = [Int: Int]()
        
        for (i, num) in bobPath.enumerated() {
            bobPathTime[num] = i
        }
        
        var alicePath = [(source: 0, time: 0, income: 0)]
        var aliceMaximumIncome = Int.min
        visited = Array(repeating: false, count: amount.count)
        visited[0] = true
        
        while var (source, time, income) = alicePath.popLast() {
            visited[source] = true
            
            if time < bobPathTime[source, default: .max] {
                income += amount[source]
            } else if time == bobPathTime[source] {
                income += amount[source] / 2
            }
            
            for nextNode in path[source] ?? [] {
                if visited[nextNode] { continue }
                
                alicePath.append((nextNode, time + 1, income))
            }
            
            if path[source, default: []].allSatisfy({ visited[$0] }) {
                aliceMaximumIncome = max(aliceMaximumIncome, income)
            }
        }
        
        return aliceMaximumIncome
    }
}
