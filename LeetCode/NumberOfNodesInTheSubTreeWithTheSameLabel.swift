//
//  NumberOfNodesInTheSubTreeWithTheSameLabel.swift
//  https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/
//
//  Created by Erik Radicheski da Silva on 12/01/23.
//

import XCTest

final class NumberOfNodesInTheSubTreeWithTheSameLabel: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSubTrees(7, [[0, 1], [0, 2], [1, 4], [1, 5], [2, 3], [2, 6]],
                                              "abaedcd"), [2, 1, 1, 1, 1, 1, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSubTrees(4, [[0, 1], [1, 2], [0, 3]], "bbbb"), [4, 2, 1, 1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countSubTrees(5, [[0, 1], [0, 2], [1, 3], [0, 4]], "aabab"),
                       [3, 2, 1, 1, 1])
    }

}

private class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var adj = [Int: [Int]]()
        
        for edge in edges {
            let (edgeA, edgeB) = (edge[0], edge[1])
            adj[edgeA, default: []].append(edgeB)
            adj[edgeB, default: []].append(edgeA)
        }
        
        var ans = Array(repeating: 0, count: n)
        let labels = Array(labels)
        let _ = depthFirst(0, -1, &adj, labels, &ans)
        
        return ans
    }
    
    private func depthFirst(_ node: Int, _ parent: Int, _ adj: inout [Int: [Int]], _ labels: [Character], _ ans: inout [Int]) -> [Int] {
        var nodeCounts = Array(repeating: 0, count: 26)
        
        let labelNode = Int(labels[node].asciiValue!)
        let a = Int(Character("a").asciiValue!)
        
        nodeCounts[labelNode - a] = 1
        
        guard let children = adj[node] else { return nodeCounts }
        
        for child in children {
            guard child != parent else { continue }
            
            var childCounts = depthFirst(child, node, &adj, labels, &ans)
            
            childCounts.enumerated().forEach { nodeCounts[$0.offset] += $0.element }
        }
        
        ans[node] = nodeCounts[labelNode - a]
        return nodeCounts
    }
}
