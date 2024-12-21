//
//  MaximumNumberOfKDivisibleComponents.swift
//  https://leetcode.com/problems/maximum-number-of-k-divisible-components/
//
//  Created by Erik Radicheski da Silva on 21/12/24.
//

import XCTest

final class MaximumNumberOfKDivisibleComponents: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxKDivisibleComponents(5, [[0, 2], [1, 2], [1, 3], [2, 4]], [1, 8, 1, 4, 4], 6), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxKDivisibleComponents(7, [[0, 1], [0, 2], [1, 3], [1, 4], [2, 5], [2, 6]], [3, 0, 6, 1, 5, 2, 1], 3), 3)
    }
    
}

private class Solution {
    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        var tree = [Int: [Int]]()
        
        for edge in edges {
            tree[edge[0], default: []].append(edge[1])
            tree[edge[1], default: []].append(edge[0])
        }
        
        var count = 0
        
        let _ = depthFirst(0, -1, tree, values, k, &count)
        
        return count
    }
    
    private func depthFirst(_ node: Int, _ parent: Int, _ tree: [Int: [Int]],
                            _ values: [Int], _ k: Int, _ count: inout Int) -> Int {
        var sum = 0
        
        for child in tree[node] ?? [] where child != parent {
            sum += depthFirst(child, node, tree, values, k, &count)
            sum %= k
        }
        
        sum += values[node]
        sum %= k
        
        if sum == 0 {
            count += 1
        }
        
        return sum
    }
}
