//
//  FindMinimumDiameterAfterMergingTwoTrees.swift
//  https://leetcode.com/problems/find-minimum-diameter-after-merging-two-trees/
//
//  Created by Erik Radicheski da Silva on 24/12/24.
//

import XCTest

final class FindMinimumDiameterAfterMergingTwoTrees: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumDiameterAfterMerge([[0, 1], [0, 2], [0, 3]], [[0, 1]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumDiameterAfterMerge([[0, 1], [0, 2], [0, 3], [2, 4], [2, 5], [3, 6], [2, 7]],
                                                          [[0, 1], [0, 2], [0, 3], [2, 4], [2, 5], [3, 6], [2, 7]]), 5)
    }
    
}

private class Solution {
    func minimumDiameterAfterMerge(_ edges1: [[Int]], _ edges2: [[Int]]) -> Int {
        let (m, n) = (edges1.count + 1, edges2.count + 1)
        
        let tree1 = tree(m, edges1)
        let tree2 = tree(n, edges2)
        
        let diameter1 = diameter(m, tree1)
        let diameter2 = diameter(n, tree2)
        
        let combined = ceil(Double(diameter1) / 2) + ceil(Double(diameter2) / 2) + 1
        
        return max(diameter1, diameter2, Int(combined))
    }
    
    private func tree(_ n: Int, _ edges: [[Int]]) -> [Int: [Int]] {
        var tree = [Int: [Int]]()
        
        for edge in edges {
            tree[edge[0], default: []].append(edge[1])
            tree[edge[1], default: []].append(edge[0])
        }
        
        return tree
    }
    
    private func diameter(_ n: Int, _ tree: [Int: [Int]]) -> Int {
        let (node, _) = farNode(n, tree, 0)
        let (_, distance) = farNode(n, tree, node)
        return distance
    }
    
    private func farNode(_ n: Int, _ tree: [Int: [Int]], _ start: Int) -> (node: Int, distance: Int) {
        var visited = Array(repeating: false, count: n)
        visited[start] = true
        
        var queue = [(node: start, distance: 0)]
        
        var farNode = start
        var maxDistance = 0
        
        while let (node, distance) = queue.popLast() {
            if distance > maxDistance {
                farNode = node
                maxDistance = distance
            }
            
            for nextNode in tree[node] ?? [] {
                if visited[nextNode] { continue }
                
                visited[nextNode] = true
                queue.append((nextNode, distance + 1))
            }
        }
        
        return (farNode, maxDistance)
    }
}
