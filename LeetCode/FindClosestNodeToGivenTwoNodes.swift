//
//  FindClosestNodeToGivenTwoNodes.swift
//  https://leetcode.com/problems/find-closest-node-to-given-two-nodes/
//
//  Created by Erik Radicheski da Silva on 25/01/23.
//

import XCTest

final class FindClosestNodeToGivenTwoNodes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.closestMeetingNode([2, 2, 3, -1], 0, 1), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.closestMeetingNode([1, 2, -1], 0, 2), 2)
    }
    
}

private class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        let n = edges.count
        var dist1 = Array(repeating: Int.max, count: n)
        var dist2 = Array(repeating: Int.max, count: n)
        
        breadthFirst(node1, edges, &dist1)
        breadthFirst(node2, edges, &dist2)
        
        var minDistNode = -1
        var minDistUntilNow = Int.max
        
        for currentNode in 0 ..< n {
            if minDistUntilNow > max(dist1[currentNode], dist2[currentNode]) {
                minDistNode = currentNode
                minDistUntilNow = max(dist1[currentNode], dist2[currentNode])
            }
        }
        
        return minDistNode
    }
    
    private func breadthFirst(_ startNode: Int, _ edges: [Int], _ dist: inout [Int]) {
        let n = edges.count
        var queue = [Int]()
        queue.append(startNode)
        
        var visit = Array(repeating: false, count: n)
        dist[startNode] = 0
        
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            guard visit[node] == false else { continue }
            
            visit[node] = true
            
            let neighbor = edges[node]
            
            if neighbor != -1 && visit[neighbor] == false {
                dist[neighbor] = 1 + dist[node]
                queue.append(neighbor)
            }
        }
    }
}
