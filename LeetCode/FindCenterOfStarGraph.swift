//
//  FindCenterOfStarGraph.swift
//  https://leetcode.com/problems/find-center-of-star-graph/
//
//  Created by Erik Radicheski da Silva on 27/06/24.
//

import XCTest

final class FindCenterOfStarGraph: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findCenter([[1, 2], [2, 3], [4, 2]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findCenter([[1, 2], [5, 1], [1, 3], [1, 4]]), 1)
    }
    
}

private class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var nodes = [Int: Int]()
        
        for edge in edges {
            nodes[edge[0], default: 0] += 1
            nodes[edge[1], default: 0] += 1
        }
        
        return nodes.first { $0.value == edges.count }?.key ?? -1
    }
}
