//
//  LargestColorValueInADirectedGraph.swift
//  https://leetcode.com/problems/largest-color-value-in-a-directed-graph/
//
//  Created by Erik Radicheski da Silva on 09/04/23.
//

import XCTest

final class LargestColorValueInADirectedGraph: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestPathValue("abaca", [[0, 1], [0, 2], [2, 3], [3, 4]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestPathValue("a", [[0, 0]]), -1)
    }

}

private class Solution {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        let colors = Array(colors)
        let nodeCount = colors.count
        
        var adj = [Int: [Int]]()
        var inDegree = Array(repeating: 0, count: nodeCount)
        
        for edge in edges {
            adj[edge[0], default: []].append(edge[1])
            inDegree[edge[1]] += 1
        }
        
        var count = Array(repeating: Array(repeating: 0, count: 26), count: nodeCount)
        var visit = Array(repeating: false, count: nodeCount)
        var inStack = Array(repeating: false, count: nodeCount)
        
        var answer = 0
        
        for i in colors.indices {
            answer = max(answer, depthFirst(i, colors, adj, &count, &visit, &inStack))
        }
        
        return answer == .max ? -1 : answer
    }
    
    private func depthFirst(_ node: Int, _ colors: [Character], _ adj: [Int: [Int]],
                            _ count: inout [[Int]], _ visit: inout [Bool],
                            _ inStack: inout [Bool]) -> Int {
        guard inStack[node] == false else { return .max }
        
        if visit[node] {
            return count[node][Int(colors[node].asciiValue!) - 97]
        }
        
        visit[node] = true
        inStack[node] = true
        
        for neighbor in adj[node, default: []] {
            if depthFirst(neighbor, colors, adj, &count, &visit, &inStack) == .max {
                return .max
            }
            for i in count[node].indices {
                count[node][i] = max(count[node][i], count[neighbor][i] )
            }
        }
        
        count[node][Int(colors[node].asciiValue!) - 97] += 1
        inStack[node] = false
        
        return count[node][Int(colors[node].asciiValue!) - 97]
    }
}
