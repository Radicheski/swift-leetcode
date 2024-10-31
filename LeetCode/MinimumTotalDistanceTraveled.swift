//
//  MinimumTotalDistanceTraveled.swift
//  https://leetcode.com/problems/minimum-total-distance-traveled/
//
//  Created by Erik Radicheski da Silva on 31/10/24.
//

import XCTest

final class MinimumTotalDistanceTraveled: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumTotalDistance([0, 4, 6], [[2, 2], [6, 2]]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumTotalDistance([1, -1], [[-2, 1], [2, 1]]), 2)
    }
    
}

private class Solution {
    func minimumTotalDistance(_ robot: [Int], _ factory: [[Int]]) -> Int {
        let robot = robot.sorted()
        let factory = factory.sorted { $0[0] < $1[0] }
        
        let factoryPositions = factory.flatMap { Array(repeating: $0[0], count: $0[1]) }
        
        var dp = [Int: [Int: Int]]()
        
        return calculateMinimumDistance(0, 0, robot, factoryPositions, &dp)
    }
    
    private func calculateMinimumDistance(_ robotIndex: Int, _ factoryIndex: Int, _ robot: [Int],
                                          _ factoryPositions: [Int], _ dp: inout [Int: [Int: Int]]) -> Int {
        guard robot.indices.contains(robotIndex) else { return 0 }
        guard factoryPositions.indices.contains(factoryIndex) else { return 1 << 40 }
        
        if let answer = dp[robotIndex]?[factoryIndex] {
            return answer
        }
        
        let assign = abs(robot[robotIndex] - factoryPositions[factoryIndex]) +
            calculateMinimumDistance(robotIndex + 1, factoryIndex + 1, robot, factoryPositions, &dp)
        
        let skip = calculateMinimumDistance(robotIndex, factoryIndex + 1, robot, factoryPositions, &dp)
        
        dp[robotIndex, default: [:]][factoryIndex] = min(skip, assign)
        
        return min(skip, assign)
    }
}
