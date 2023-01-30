//
//  ReorderRoutesToMakeAllPathsLeadToTheCityZero.swift
//  https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/
//
//  Created by Erik Radicheski da Silva on 30/01/23.
//

import XCTest

final class ReorderRoutesToMakeAllPathsLeadToTheCityZero: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minReorder(6, [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minReorder(5, [[1, 0], [1, 2], [3, 2], [3, 4]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minReorder(3, [[1, 0], [2, 0]]), 0)
    }
    
}

private class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var result = 0
        
        var outgoing = [Int: Set<Int>]()
        var incoming = [Int: Set<Int>]()
        
        for connection in connections {
            outgoing[connection[0], default: []].insert(connection[1])
            incoming[connection[1], default: []].insert(connection[0])
        }
        
        depthFirst(0, &outgoing, &incoming, &result)
        
        return result
    }
    
    private func depthFirst(_ node: Int, _ outgoing: inout [Int: Set<Int>],
                            _ incoming: inout [Int: Set<Int>], _ result: inout Int) {
        
        for nextNode in outgoing[node, default: []] {
            result += 1
            incoming[nextNode]?.remove(node)
            depthFirst(nextNode, &outgoing, &incoming, &result)
        }
        
        for nextNode in incoming[node, default: []] {
            outgoing[nextNode]?.remove(node)
            depthFirst(nextNode, &outgoing, &incoming, &result)
        }
    }
}
