//
//  ValidArrangementOfPairs.swift
//  https://leetcode.com/problems/valid-arrangement-of-pairs/
//
//  Created by Erik Radicheski da Silva on 30/11/24.
//

import XCTest

final class ValidArrangementOfPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.validArrangement([[5, 1], [4, 5], [11, 9], [9, 4]]), [[11, 9], [9, 4], [4, 5], [5, 1]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.validArrangement([[1, 3], [3, 2], [2, 1]]), [[1, 3], [3, 2], [2, 1]])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.validArrangement([[1, 2], [1, 3], [2, 1]]), [[1, 2], [2, 1], [1, 3]])
    }
    
}

private class Solution {
    func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
        var neighbors = [Int: [Int]]()
        var inDegree = [Int: Int]()
        var outDegree = [Int: Int]()
        
        for pair in pairs {
            neighbors[pair[0], default: []].append(pair[1])
            outDegree[pair[0], default: 0] += 1
            inDegree[pair[1], default: 0] += 1
        }
        
        var result = [Int]()
        
        var startNode = -1
        
        for (node, outcoming) in outDegree {
            if outcoming == inDegree[node, default: 0] + 1 {
                startNode = node
                break
            }
        }
        
        if startNode == -1 {
            startNode = pairs[0][0]
        }
        
        visit(startNode, &neighbors, &result)
        
        result.reverse()
        
        var pairResult = Array(repeating: Array(repeating: 0, count: 2), count: result.count - 1)
        
        for i in 1 ..< result.endIndex {
            pairResult[i - 1] = [result[i - 1], result[i]]
        }
        
        return pairResult
    }
    
    private func visit(_ node: Int, _ neighbors: inout [Int: [Int]], _ result: inout [Int]) {
        while var list = neighbors[node], list.isEmpty == false {
            let next = list.removeFirst()
            neighbors[node] = list
            visit(next, &neighbors, &result)
        }
        
        result.append(node)
    }
}
