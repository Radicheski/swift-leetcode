//
//  NumberOfOperationsToMakeNetworkConnected.swift
//  https://leetcode.com/problems/number-of-operations-to-make-network-connected/
//
//  Created by Erik Radicheski da Silva on 28/01/23.
//

import XCTest

final class NumberOfOperationsToMakeNetworkConnected: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.makeConnected(4, [[0, 1], [0, 2], [1, 2]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.makeConnected(6, [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3]]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.makeConnected(6, [[0, 1], [0, 2], [0, 3], [1, 2]]), -1)
    }

}

private class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= n - 1 else { return -1 }
        
        var nodes: [Set<Int>] = Array(repeating: Set(), count: n)
        
        var unconnectedNodes = Set(0 ..< n)
        
        for connection in connections {
            unconnectedNodes.subtract(connection)
            
            let (nodeA, nodeB) = (connection[0], connection[1])
            
            nodes[nodeA].formUnion(connection)
            nodes[nodeB].formUnion(connection)
        }
        
        for node in 0 ..< n where unconnectedNodes.contains(node) == false {
            var queue = Array(nodes[node])
            
            while queue.isEmpty == false {
                let nextNode = queue.removeLast()
                
                guard nextNode != node else { continue }
                
                nodes[node].formUnion(nodes[nextNode])
                queue.append(contentsOf: nodes[nextNode])
                
                nodes[nextNode].removeAll()
            }
        }
        
        return unconnectedNodes.count + nodes.filter { $0.isEmpty == false }.count - 1
    }
}
