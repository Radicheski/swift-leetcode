//
//  RobotCollisions.swift
//  https://leetcode.com/problems/robot-collisions/
//
//  Created by Erik Radicheski da Silva on 13/07/24.
//

import XCTest

final class RobotCollisions: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.survivedRobotsHealths([5, 4, 3, 2, 1], [2, 17, 9, 15, 10], "RRRRR"), [2, 17, 9, 15, 10])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.survivedRobotsHealths([3, 5, 2, 6], [10, 10, 15, 12], "RLRL"), [14])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.survivedRobotsHealths([1, 2, 5, 6], [10, 10, 11, 11], "RLRL"), [])
    }
    
}

private class Solution {
    func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
        var robots = [Robot]()
        
        for (order, direction) in directions.enumerated() {
            robots.append(Robot(order: order, position: positions[order],
                                health: healths[order], direction: direction))
        }
        
        robots.sort { $0.position < $1.position }
        
        var stack = [Robot]()
        var i = 0
        
        while i < robots.endIndex {
            let robot = robots[i]
            if stack.isEmpty
                || stack.last?.direction == robot.direction
                || (stack.last?.direction == "L" && robot.direction == "R") {
                stack.append(robot)
                i += 1
            } else {
                if let last = stack.last {
                    if last.health == robot.health {
                        let _ = stack.popLast()
                        i += 1
                    } else if last.health > robot.health {
                        last.health -= 1
                        if last.health == 0 { let _ = stack.popLast() }
                        i += 1
                    } else {
                        robot.health -= 1
                        let _ = stack.popLast()
                    }
                }
            }
        }
        
        return stack.sorted { $0.order < $1.order }.map(\.health)
    }
    
    class Robot {
        var order: Int
        var position: Int
        var health: Int
        var direction: Character
        
        init(order: Int, position: Int, health: Int, direction: Character) {
            self.order = order
            self.position = position
            self.health = health
            self.direction = direction
        }
    }
}
