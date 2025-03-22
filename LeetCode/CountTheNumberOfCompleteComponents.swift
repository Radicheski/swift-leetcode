//
//  CountTheNumberOfCompleteComponents.swift
//  https://leetcode.com/problems/count-the-number-of-complete-components/
//
//  Created by Erik Radicheski da Silva on 22/03/25.
//

import XCTest

final class CountTheNumberOfCompleteComponents: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countCompleteComponents(6, [[0, 1], [0, 2], [1, 2], [3, 4]]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countCompleteComponents(6, [[0, 1], [0, 2], [1, 2], [3, 4], [3, 5]]), 1)
    }
    
}

private class Solution {
    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [Int: Set<Int>]()
        
        for edge in edges {
            graph[edge[0], default: []].formUnion(edge)
            graph[edge[1], default: []].formUnion(edge)
        }
        
        var frequency = [Set<Int>: Int]()
        
        for pattern in graph.values {
            frequency[pattern, default: 0] += 1
        }
        
        var answer = 0
        
        for (pattern, count) in frequency {
            guard pattern.count == count else { continue }
            answer += 1
        }
        
        answer += Set(0 ..< n).subtracting(graph.keys).count
        
        return answer
    }
}
