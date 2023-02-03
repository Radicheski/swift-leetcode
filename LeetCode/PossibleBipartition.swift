//
//  PossibleBipartition.swift
//  https://leetcode.com/problems/possible-bipartition/
//
//  Created by Erik Radicheski da Silva on 03/02/23.
//

import XCTest

final class PossibleBipartition: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.possibleBipartition(4, [[1, 2], [1, 3], [2, 4]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.possibleBipartition(3, [[1, 2], [1, 3], [2, 3]]))
    }

}

private class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var adj = [Int: [Int]]()
        
        for edge in dislikes {
            let personA = edge[0]
            let personB = edge[1]
            
            adj[personA, default: []].append(personB)
            adj[personB, default: []].append(personA)
        }
        
        var color: [Color] = Array(repeating: .none, count: n + 1)
        
        for person in 1 ... n {
            if color[person] == .none {
                guard breadthFirst(person, adj, &color) else { return false }
            }
        }
        
        return true
    }
    
    private func breadthFirst(_ person: Int, _ adj: [Int: [Int]], _ color: inout [Color]) -> Bool {
        var queue = [person]
        color[person] = .blue
        
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            
            for neighbor in adj[node] ?? [] {
                switch color[neighbor] {
                    
                case color[node]: return false
                    
                case .none:
                    color[neighbor] = color[node] == .blue ? .green : .blue
                    queue.append(neighbor)
                    
                default: continue
                    
                }
            }
        }
        
        return true
    }
    
    private enum Color {
        case none, blue, green
    }
}
