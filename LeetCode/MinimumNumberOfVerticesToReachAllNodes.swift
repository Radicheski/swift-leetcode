//
//  MinimumNumberOfVerticesToReachAllNodes.swift
//  https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/
//
//  Created by Erik Radicheski da Silva on 16/10/22.
//

import XCTest

final class MinimumNumberOfVerticesToReachAllNodes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = Set(solution.findSmallestSetOfVertices(6, [[0, 1], [0, 2], [2, 5], [3, 4], [4, 2]]))
        let expectedOutput = Set([0, 3])
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleB() {
        let output = Set(solution.findSmallestSetOfVertices(5, [[0, 1], [2, 1], [3, 1], [1, 4], [2, 4]]))
        let expectedOutput = Set([0, 2, 3])
        XCTAssertEqual(output, expectedOutput)
    }

}

private class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var result = [Int]()
        
        var set = Set(0 ..< n)
        for edge in edges {
            set.remove(edge[1])
        }
        
        result.append(contentsOf: set)
        
        return result
    }
}
