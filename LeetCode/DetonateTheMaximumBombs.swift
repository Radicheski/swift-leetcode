//
//  DetonateTheMaximumBombs.swift
//  https://leetcode.com/problems/detonate-the-maximum-bombs/
//
//  Created by Erik Radicheski da Silva on 02/06/23.
//

import XCTest

final class DetonateTheMaximumBombs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumDetonation([[2, 1, 3], [6, 1, 4]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumDetonation([[1, 1, 5], [10, 10, 5]]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumDetonation([[1, 2, 3], [2, 3, 1], [3, 4, 2], [4, 5, 3], [5, 6, 4]]), 5)
    }

}

private class Solution {
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        var graph = [Int: [Int]]()
        
        for (i, bombA) in bombs.enumerated() {
            for (j, bombB) in bombs.enumerated() where j > i {
                if pow(Decimal(bombA[2]), 2) >= pow(Decimal(bombA[0] - bombB[0]), 2) + pow(Decimal(bombA[1] - bombB[1]), 2) {
                    graph[i, default: []].append(j)
                }
                
                if pow(Decimal(bombB[2]), 2) >= pow(Decimal(bombA[0] - bombB[0]), 2) + pow(Decimal(bombA[1] - bombB[1]), 2) {
                    graph[j, default: []].append(i)
                }
            }
        }
        
        var result = Int.min
        
        for i in bombs.indices {
            var visited = Set<Int>()
            
            result = max(result, depthFirst(i, graph, &visited))
        }
        
        return result
    }
    
    private func depthFirst(_ bomb: Int, _ bombs: [Int: [Int]], _ visited: inout Set<Int>) -> Int {
        guard visited.contains(bomb) == false else { return 0 }
        
        visited.insert(bomb)
        var detonated = 1
        
        for neighbor in bombs[bomb, default: []] {
            detonated += depthFirst(neighbor, bombs, &visited)
        }
        
        return detonated
    }
}
