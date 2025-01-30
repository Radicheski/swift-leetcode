//
//  DivideNodesIntoTheMaximumNumberOfGroups.swift
//  https://leetcode.com/problems/divide-nodes-into-the-maximum-number-of-groups/
//
//  Created by Erik Radicheski da Silva on 30/01/25.
//

import XCTest

final class DivideNodesIntoTheMaximumNumberOfGroups: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.magnificentSets(6, [[1, 2], [1, 4], [1, 5], [2, 6], [2, 3], [4, 6]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.magnificentSets(3, [[1, 2], [2, 3], [3, 1]]), -1)
    }
    
}

private class Solution {
    func magnificentSets(_ n: Int, _ edges: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            adjList[edge[0] - 1].append(edge[1] - 1)
            adjList[edge[1] - 1].append(edge[0] - 1)
        }

        var colors: [Int?] = Array(repeating: nil, count: n)
        
        for node in 0 ..< n {
            guard colors[node] == nil else { continue }
            
            colors[node] = 0
            
            guard isBipartite(adjList, node, &colors) else { return -1 }
        }
        
        var distances = Array(repeating: 0, count: n)
        for node in 0 ..< n {
            distances[node] = getLongestShortestPath(adjList, node, n)
        }

        var maxNumberOfGroups = 0
        var visited = Array(repeating: false, count: n)
        
        for node in 0 ..< n {
            if visited[node] { continue }

            maxNumberOfGroups += getNumberOfGroupsForComponent(adjList, node, distances, &visited)
        }

        return maxNumberOfGroups
    }

    private func isBipartite(_ adjList: [[Int]], _ node: Int, _ colors: inout [Int?]) -> Bool {
        for neighbor in adjList[node] {
            if colors[neighbor] == colors[node] { return false }

            guard colors[neighbor] == nil else { continue }

            colors[neighbor] = (colors[node]! + 1) % 2

            guard isBipartite(adjList, neighbor, &colors) else { return false }
        }

        return true
    }

    private func getLongestShortestPath(_ adjList: [[Int]], _ srcNode: Int, _ n: Int) -> Int {
        var nodesQueue = [Int]()
        var visited = Array(repeating: false, count: n)

        nodesQueue.append(srcNode)
        visited[srcNode] = true
        var distance = 0

        while !nodesQueue.isEmpty {
            let numOfNodesInLayer = nodesQueue.count
            for i in 0 ..< numOfNodesInLayer {
                let currentNode = nodesQueue.removeFirst()

                for neighbor in adjList[currentNode] {
                    if visited[neighbor] { continue }
                    visited[neighbor] = true
                    nodesQueue.append(neighbor)
                }
            }
            
            distance += 1
        }

        return distance
    }

    private func getNumberOfGroupsForComponent( _ adjList: [[Int]], _ node: Int, _ distances: [Int],
                                                _ visited: inout [Bool]) -> Int {
        var maxNumberOfGroups = distances[node]
        visited[node] = true

        for neighbor in adjList[node] {
            if visited[neighbor] { continue }
            
            maxNumberOfGroups = max(
                maxNumberOfGroups,
                getNumberOfGroupsForComponent(adjList, neighbor, distances, &visited)
            )
        }
        
        return maxNumberOfGroups
    }
}
