//
//  MinimumJumpsToReachHome.swift
//  https://leetcode.com/problems/minimum-jumps-to-reach-home/
//
//  Created by Erik Radicheski da Silva on 31/01/23.
//

import XCTest

final class MinimumJumpsToReachHome: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumJumps([14, 4, 18, 1, 15], 3, 15, 9), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumJumps([8, 3, 16, 6, 12, 20], 15, 13, 11), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumJumps([1, 6, 2, 14, 5, 17, 4], 16, 9, 7), 2)
    }

}

private class Solution {
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        var steps = 0
        var maximumDistance = x + a + b
        
        var queue = [Position(direction: .forward, distance: 0)]
        
        var visited = Set(queue)
        
        for forbid in forbidden {
            visited.insert(Position(direction: .forward, distance: forbid))
            visited.insert(Position(direction: .backward, distance: forbid))
            maximumDistance = max(maximumDistance, forbid + a + b)
        }
        
        while queue.isEmpty == false {
            for _ in 0 ..< queue.endIndex {
                let pair = queue.removeFirst()
                if pair.distance == x {
                    return steps
                }
                
                let forward = Position(direction: .forward, distance: pair.distance + a)
                let backward = Position(direction: .backward , distance: pair.distance - b)
                
                if pair.distance + a <= maximumDistance && visited.contains(forward) == false {
                    queue.append(forward)
                    visited.insert(forward)
                }
                
                if pair.direction == .forward && pair.distance - b >= 0 && visited.contains(backward) == false {
                    queue.append(backward)
                }
            }
            
            steps += 1
        }
        
        return -1
    }
    
    private enum Direction {
        case backward, forward
    }
    
    private struct Position: Hashable {
        let direction: Direction
        let distance: Int
    }
}
