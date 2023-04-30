//
//  RemoveMaxNumberOfEdgesToKeepGraphFullyTraversable.swift
//  https://leetcode.com/problems/remove-max-number-of-edges-to-keep-graph-fully-traversable/
//
//  Created by Erik Radicheski da Silva on 30/04/23.
//

import XCTest

final class RemoveMaxNumberOfEdgesToKeepGraphFullyTraversable: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxNumEdgesToRemove(4, [[3, 1, 2], [3, 2, 3], [1, 1, 3], [1, 2, 4], [1, 1, 2], [2, 3, 4]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxNumEdgesToRemove(4, [[3, 1, 2], [3, 2, 3], [1, 1, 4], [2, 1, 4]]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxNumEdgesToRemove(4, [[3, 2, 3], [1, 1, 2], [2, 3, 4]]), -1)
    }

}

private class Solution {
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        let alice = UnionFind(n)
        let bob = UnionFind(n)
        
        var edgesRequired = 0
        
        for edge in edges {
            if edge[0] == 3 {
                edgesRequired += alice.performUnion(edge[1], edge[2]) | bob.performUnion(edge[1], edge[2])
            }
        }
        
        for edge in edges {
            if edge[0] == 1 {
                edgesRequired += alice.performUnion(edge[1], edge[2])
            } else if edge[0] == 2 {
                edgesRequired += bob.performUnion(edge[1], edge[2])
            }
        }
        
        if alice.isConnected && bob.isConnected {
            return edges.count - edgesRequired
        }
        
        return -1
    }
}

private class UnionFind {
    private var representative: [Int]
    private var componentSize: [Int]
    private var components: Int
    
    var isConnected: Bool { components == 1 }
    
    init(_ n: Int) {
        self.components = n
        self.representative = Array(0 ... n + 1)
        self.componentSize = Array(0 ... n + 1)
    }
    
    private func findRepresentative(_ x: Int) -> Int {
        if representative[x] == x { return x }
        
        representative[x] = findRepresentative(representative[x])
        return representative[x]
    }
    
    func performUnion(_ x: Int, _ y: Int) -> Int {
        let x = findRepresentative(x)
        let y = findRepresentative(y)
        
        if x == y { return 0 }
        
        if componentSize[x] > componentSize[y] {
            componentSize[x] += componentSize[y]
            representative[y] = x
        } else {
            componentSize[y] += componentSize[x]
            representative[x] = y
        }
        
        components -= 1
        
        return 1
    }
}
