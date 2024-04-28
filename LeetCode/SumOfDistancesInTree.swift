//
//  SumOfDistancesInTree.swift
//  https://leetcode.com/problems/sum-of-distances-in-tree/
//
//  Created by Erik Radicheski da Silva on 28/04/24.
//

import XCTest

final class SumOfDistancesInTree: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sumOfDistancesInTree(6, [[0, 1], [0, 2], [2,  3], [2, 4], [2, 5]]),
                       [8, 12, 6, 10, 10, 10])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sumOfDistancesInTree(1, []), [0])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.sumOfDistancesInTree(2, [[1, 0]]), [1, 1])
    }
    
}

private class Solution {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var tree = [Int: [Int]]()
        var distance = Array(repeating: 0, count: n)
        var size = Array(repeating: 1, count: n)
        
        for edge in edges {
            tree[edge[0], default: []].append(edge[1])
            tree[edge[1], default: []].append(edge[0])
        }
        
        getSizes(tree, &distance, &size, 0, -1)
        getDistances(tree, &distance, &size, 0, -1)
        
        return distance
    }
    
    private func getSizes(_ tree: [Int: [Int]], _ distance: inout [Int], _ size: inout [Int],
                     _ node: Int, _ parent: Int) {
        for child in tree[node, default: []] where child != parent {
            getSizes(tree, &distance, &size, child, node)
            size[node] += size[child]
            distance[node] += distance[child] + size[child]
        }
        
    }
    
    private func getDistances(_ tree: [Int: [Int]], _ distance: inout [Int], _ size: inout [Int],
                      _ node: Int, _ parent: Int) {
        for child in tree[node, default: []] where child != parent {
            distance[child] = distance[node] - 2 * size[child] + size.count
            getDistances(tree, &distance, &size, child, node)
        }
    }
}
