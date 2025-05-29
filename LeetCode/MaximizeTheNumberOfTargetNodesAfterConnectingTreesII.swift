//
//  MaximizeTheNumberOfTargetNodesAfterConnectingTreesII.swift
//  https://leetcode.com/problems/maximize-the-number-of-target-nodes-after-connecting-trees-ii/
//
//  Created by Erik Radicheski da Silva on 29/05/25.
//

import XCTest

final class MaximizeTheNumberOfTargetNodesAfterConnectingTreesII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxTargetNodes([[0, 1], [0, 2], [2, 3], [2, 4]], [[0, 1], [0, 2], [0, 3], [2, 7], [1, 4], [4, 5], [4, 6]]), [8, 7, 7, 8, 8])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxTargetNodes([[0, 1], [0, 2], [0, 3], [0, 4]], [[0, 1], [1, 2], [2, 3]]), [3, 6, 6, 6, 6])
    }
    
}

private class Solution {
    func maxTargetNodes(_ edges1: [[Int]], _ edges2: [[Int]]) -> [Int] {
        let n = edges1.count + 1
        let m = edges2.count + 1
        var color1 = Array(repeating: 0, count: n)
        var color2 = Array(repeating: 0, count: m)
        let count1 = build(edges1, &color1)
        let count2 = build(edges2, &color2)
        let maxCount2 = count2.max() ?? 0
        var answer = Array(repeating: 0, count: n)
        for i in 0 ..< n {
            answer[i] = count1[color1[i]] + (count2.max() ?? 0)
        }
        
        return answer
    }

    private func build(_ edges: [[Int]], _ color: inout [Int]) -> [Int] {
        let n = edges.count + 1
        var children = Array(repeating: [Int](), count: n)
        for edge in edges {
            children[edge[0]].append(edge[1])
            children[edge[1]].append(edge[0])
        }
        let answer = depthFirst(0, -1, 0, children, &color)
        return [answer, n - answer]
    }

    private func depthFirst(_ node: Int, _ parent: Int, _ depth: Int, _ children: [[Int]], _ color: inout [Int]) -> Int {
        var answer = 1 - (depth % 2)
        color[node] = depth % 2
        for child in children[node] where child != parent {
            answer += depthFirst(child, node, depth + 1, children, &color)
        }
        return answer
    }
}
