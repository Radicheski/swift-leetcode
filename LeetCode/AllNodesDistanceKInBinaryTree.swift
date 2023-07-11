//
//  AllNodesDistanceKInBinaryTree.swift
//  https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/
//
//  Created by Erik Radicheski da Silva on 11/07/23.
//

import XCTest

final class AllNodesDistanceKInBinaryTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let root = TreeNode.parseTree(from: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
        let output = Set(solution.distanceK(root, root?.left, 2))
        let expectedOutput = Set([7, 4, 1])
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleB() {
        let root = TreeNode.parseTree(from: [1])
        let output = Set(solution.distanceK(root, root, 3))
        let expectedOutput = Set<Int>()
        XCTAssertEqual(output, expectedOutput)
    }
    
}

private class Solution {
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root else { return [] }
        guard let target = target else { return [] }
        
        var graph = [Int: [Int]]()
        buildGraph(root, nil, &graph)
        
        var answer = [Int]()
        var visited = Set([target.val])
        
        depthFirst(target.val, 0, k, &answer, &graph, &visited)
        
        return answer
    }
    
    private func buildGraph(_ current: TreeNode?, _ parent: TreeNode?, _ graph: inout [Int: [Int]]) {
        
        if let current = current, let parent = parent {
            graph[current.val, default: []].append(parent.val)
            graph[parent.val, default: []].append(current.val)
        }
        
        if let left = current?.left {
            buildGraph(left, current, &graph)
        }
        
        if let right = current?.right {
            buildGraph(right, current, &graph)
        }
    }
    
    private func depthFirst(_ current: Int, _ distance: Int, _ k: Int, _ answer: inout [Int],
                            _ graph: inout [Int: [Int]], _ visited: inout Set<Int>) {
        guard distance != k else {
            answer.append(current)
            return
        }
        
        for neighbor in graph[current, default: []] {
            if visited.contains(neighbor) == false {
                visited.insert(neighbor)
                depthFirst(neighbor, distance + 1, k, &answer, &graph, &visited)
            }
        }
    }
}
