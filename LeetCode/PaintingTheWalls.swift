//
//  PaintingTheWalls.swift
//  https://leetcode.com/problems/painting-the-walls/
//
//  Created by Erik Radicheski da Silva on 14/10/23.
//

import XCTest

final class PaintingTheWalls: XCTestCase {

    private let solution = Solution()
    
    func testExmapleA() {
        XCTAssertEqual(solution.paintWalls([1, 2, 3, 2], [1, 2, 3, 2]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.paintWalls([2, 3, 4, 2], [1, 1, 1, 1]), 4)
    }
    
}

private class Solution {
    
    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: cost.count + 1), count: cost.count)
        
        return paintWall(0, cost.count, cost, time, &dp)
    }
    
    private func paintWall(_ index: Int, _ remain: Int, _ cost: [Int], _ time: [Int], _ dp: inout [[Int?]]) -> Int {
        guard remain > 0 else { return 0 }
        guard index < cost.count else { return 1 << 32 }
        
        if let answer = dp[index][remain] {
            return answer
        }
        
        let answer = min(cost[index] + paintWall(index + 1, remain - time[index] - 1, cost, time, &dp),
                         paintWall(index + 1, remain, cost, time, &dp))
        
        dp[index][remain] = answer
        return answer
    }
    
}
