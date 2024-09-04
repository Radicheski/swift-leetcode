//
//  WalkingRobotSimulation.swift
//  https://leetcode.com/problems/walking-robot-simulation/
//
//  Created by Erik Radicheski da Silva on 04/09/24.
//

import XCTest

final class WalkingRobotSimulation: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.robotSim([4, -1, 3], []), 25)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.robotSim([4, -1, 4, -2, 4], [[2,4]]), 65)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.robotSim([6, -1, -1, 6], []), 36)
    }
    
}

private class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var maximumDistance = 0
        let obstacles = Set(obstacles)
        
        var (x, y) = (0, 0)
        var (dx, dy) = (0, 1)
        
        for command in commands {
            if command == -1 {
                (dx, dy) = (dy, -dx)
            } else if command == -2 {
                (dx, dy) = (-dy, dx)
            } else {
                for _ in 0 ..< command {
                    if obstacles.contains([x + dx, y + dy]) { break }
                    (x, y) = (x + dx, y + dy)
                    maximumDistance = max(maximumDistance, x * x + y * y)
                }
            }
        }
        
        return maximumDistance
    }
}
