//
//  FindCriticalAndPseudoCriticalEdgesInMinimumSpanningTree.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 19/08/23.
//

import XCTest

final class FindCriticalAndPseudoCriticalEdgesInMinimumSpanningTree: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findCriticalAndPseudoCriticalEdges(5, [[0, 1, 1], [1, 2, 1], [2, 3, 2], [0, 3, 2], [0, 4, 3], [3, 4, 3], [1, 4, 6]]), [[0, 1], [2, 3, 4, 5]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findCriticalAndPseudoCriticalEdges(4, [[0, 1, 1], [1, 2, 1], [2, 3, 1], [0, 3, 1]]), [[], [0, 1, 2, 3]])
    }
}

private class Solution {
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let m = edges.count
        var newEdges = Array(repeating: Array(repeating: 0, count: 4), count: m)
        
        for i in 0 ..< m {
            for j in 0 ..< 3 {
                newEdges[i][j] = edges[i][j]
            }
            newEdges[i][3] = i
        }
        
        newEdges.sort { $0[2] < $1[2] }
        
        var union = UnionFind(n)
        var standardWeight = 0
        
        for edge in newEdges {
            if union.union(edge[0], edge[1]) {
                standardWeight += edge[2]
            }
        }
        
        var result = Array(repeating: [Int](), count: 2)
        
        for i in 0 ..< m {
            var ignore = UnionFind(n)
            var ignoreWeight = 0
            
            for j in 0 ..< m {
                if i != j && ignore.union(newEdges[j][0], newEdges[j][1]) {
                    ignoreWeight += newEdges[j][2]
                }
            }
            
            if ignore.maximumSize < n || ignoreWeight > standardWeight {
                result[0].append(newEdges[i][3])
            } else {
                var force = UnionFind(n)
                let _ = force.union(newEdges[i][0], newEdges[i][1])
                
                var forceWeight = newEdges[i][2]
                
                for j in 0 ..< m {
                    if i != j && force.union(newEdges[j][0], newEdges[j][1]) {
                        forceWeight += newEdges[j][2]
                    }
                }
                
                if forceWeight == standardWeight {
                    result[1].append(newEdges[i][3])
                }
            }
        }
        
        
        return result
    }
}

private struct UnionFind {
    private var parent: [Int]
    private var size: [Int]
    private(set) var maximumSize: Int
    
    init(_ n: Int) {
        parent = .init(repeating: 0, count: n)
        size = .init(repeating: 0, count: n)
        maximumSize = 1
        
        for i in 0 ..< n {
            parent[i] = i
            size[i] = 1
        }
    }
    
     mutating func find(_ x: Int) -> Int {
        if x != parent[x] {
            parent[x] = find(parent[x])
        }
        
        return parent[x]
    }
    
    mutating func union(_ x: Int, _ y: Int) -> Bool {
        var rootX = find(x)
        var rootY = find(y)
        
        if rootX != rootY {
            if size[rootX] < size[rootY] {
                rootX = rootX ^ rootY
                rootY = rootX ^ rootY
                rootX = rootX ^ rootY
            }
            
            parent[rootY] = rootX
            size[rootX] += size[rootY]
            maximumSize = max(maximumSize, size[rootX])
            
            return true
        }
        
        return false
    }
    
 }
