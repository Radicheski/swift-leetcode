//
//  ShortestPathWithAlternatingColors.swift
//  https://leetcode.com/problems/shortest-path-with-alternating-colors/
//
//  Created by Erik Radicheski da Silva on 30/01/23.
//

import XCTest

final class ShortestPathWithAlternatingColors: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestAlternatingPaths(3, [[0, 1], [1, 2]], []), [0, 1, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestAlternatingPaths(3, [[0, 1]], [[2, 1]]), [0, 1, -1])
    }

}

private class Solution {
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var adj = [Int: [(node: Int, color: Int)]]()
        
        for redEdge in redEdges {
            adj[redEdge[0], default: []].append((redEdge[1], 0))
        }
        
        for blueEdge in blueEdges {
            adj[blueEdge[0], default: []].append((blueEdge[1], 1))
        }
        
        var answer = Array(repeating: -1, count: n)
        var visit = Array(repeating: [false, false], count: n)
        
        var queue = [[Int]]()
        
        queue.append([0, 0, -1])
        
        answer[0] = 0
        
        visit[0][0] = true
        visit[0][1] = true
        
        while queue.isEmpty == false {
            let element = queue.removeFirst()
            let (node, steps, previousColor) = (element[0], element[1], element[2])
            
            guard let neighbors = adj[node] else { continue }
            
            for neighbor in neighbors {
                let (neighbor, color) = neighbor
                if visit[neighbor][color] == false && color != previousColor {
                    if answer[neighbor] == -1 {
                        answer[neighbor] = steps + 1
                    }
                    visit[neighbor][color] = true
                    queue.append([neighbor, steps + 1, color])
                }
            }
        }
        
        return answer
    }
}
