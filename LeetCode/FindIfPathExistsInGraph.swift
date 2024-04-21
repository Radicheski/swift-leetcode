//
//  FindIfPathExistsInGraph.swift
//  https://leetcode.com/problems/find-if-path-exists-in-graph/
//
//  Created by Erik Radicheski da Silva on 21/04/24.
//

import XCTest

final class FindIfPathExistsInGraph: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.validPath(3, [[0, 1], [1, 2], [2, 0]], 0, 2))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.validPath(6, [[0, 1], [0, 2], [3, 5], [5, 4], [4, 3]], 0, 5))
    }
    
}

private class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var vertices = [Int: [Int]]()
        var visited = Set<Int>()
        
        for edge in edges {
            vertices[edge[0], default: []].append(edge[1])
            vertices[edge[1], default: []].append(edge[0])
        }
        
        var queue = [source]
        
        while let vertex = queue.popLast() {
            guard vertex != destination else { return true }
            
            guard visited.insert(vertex) == (true, vertex) else { continue }
            
            if let neighbors = vertices[vertex] {
                queue.append(contentsOf: neighbors)
            }
        }
        
        return false
    }
}
