//
//  FindEventualSafeStates.swift
//  https://leetcode.com/problems/find-eventual-safe-states/
//
//  Created by Erik Radicheski da Silva on 29/01/23.
//

import XCTest

final class FindEventualSafeStates: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.eventualSafeNodes([[1, 2], [2, 3], [5], [0], [5], [], []]), [2, 4, 5, 6])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.eventualSafeNodes([[1, 2, 3, 4], [1, 2], [3, 4], [0, 4],[]]), [4])
    }
    
}

private class Solution {
    
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var color: [Color] = Array(repeating: .white, count: graph.count)
        
        var ans = [Int]()
        
        for i in graph.indices {
            if depthFirst(i, &color, graph) {
                ans.append(i)
            }
        }
        
        return ans
    }
    
    private func depthFirst(_ node: Int, _ color: inout [Color], _ graph: [[Int]]) -> Bool {
        guard color[node] == .white else { return color[node] == .black }
        
        color[node] = .gray
        
        for nextNode in graph[node] {
            guard color[node] != .black else { continue }
            
            if color[nextNode] == .gray || depthFirst(nextNode, &color, graph) == false {
                return false
            }
        }
        
        color[node] = .black
        
        return true
    }
    
    
    private enum Color {
        case white, gray, black
    }
}
