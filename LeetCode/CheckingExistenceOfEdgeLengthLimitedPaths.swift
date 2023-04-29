//
//  CheckingExistenceOfEdgeLengthLimitedPaths.swift
//  https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/
//
//  Created by Erik Radicheski da Silva on 29/04/23.
//

import XCTest

final class CheckingExistenceOfEdgeLengthLimitedPaths: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.distanceLimitedPathsExist(3, [[0, 1, 2], [1, 2, 4], [2, 0, 8], [1, 0, 16]],
                                                          [[0, 1, 2], [0, 2, 5]]), [false, true])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.distanceLimitedPathsExist(5, [[0, 1, 10], [1, 2, 5], [2, 3, 9], [3, 4, 13]],
                                                          [[0, 4, 14], [1, 4, 13]]), [true, false])
    }

}

private class Solution {
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        let union = UnionFind(size: n)
        let queriesCount = queries.count
        var answer = Array(repeating: false, count: queriesCount)
        
        var queriesWithIndex = queries.enumerated().map { $0.element + [$0.offset] }
            .sorted { $0[2] < $1[2] }
        
        let edgeList = edgeList.sorted { $0[2] < $1[2] }
        
        var edgesIndex = 0
        
        for queryIndex in 0 ..< queriesCount {
            let p = queriesWithIndex[queryIndex][0]
            let q = queriesWithIndex[queryIndex][1]
            let limit = queriesWithIndex[queryIndex][2]
            let originalIndex = queriesWithIndex[queryIndex][3]
            
            while edgeList.indices.contains(edgesIndex) && edgeList[edgesIndex][2] < limit {
                let nodeA = edgeList[edgesIndex][0]
                let nodeB = edgeList[edgesIndex][1]
                union.join(nodeA, nodeB)
                edgesIndex += 1
            }
            
            answer[originalIndex] = union.areConnected(p, q)
        }
        
        return answer
    }
}

private class UnionFind {
    private var group: [Int]
    private var rank: [Int]
    
    init(size: Int) {
        self.group = Array(0 ..< size)
        self.rank = Array(repeating: 0, count: size)
    }
    
    func find(_ node: Int) -> Int {
        if group[node] != node {
            group[node] = find(group[node])
        }
        return group[node]
    }
    
    func join(_ nodeA: Int, _ nodeB: Int) {
        let groupA = find(nodeA)
        let groupB = find(nodeB)
        
        if groupA == groupB { return }
        
        if rank[groupA] > rank[groupB] {
            group[groupB] = groupA
        } else if rank[groupA] < rank[groupB] {
            group[groupA] = groupB
        } else {
            group[groupA] = groupB
            rank[groupB] += 1
        }
    }
    
    func areConnected(_ nodeA: Int, _ nodeB: Int) -> Bool {
        return find(nodeA) == find(nodeB)
    }
}
