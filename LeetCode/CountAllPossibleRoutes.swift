//
//  CountAllPossibleRoutes.swift
//  https://leetcode.com/problems/count-all-possible-routes/
//
//  Created by Erik Radicheski da Silva on 25/06/23.
//

import XCTest

final class CountAllPossibleRoutes: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countRoutes([2, 3, 6, 8, 4], 1, 3, 5), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countRoutes([4, 3, 1], 1, 0, 6), 5)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        var dp: [[Int?]] = locations.indices.map { _ in
            Array(repeating: nil, count: fuel + 1)
        }
        
        let answer = depthFirst(start, finish, fuel, locations, &dp)
        
        return answer
    }
    
    private func depthFirst(_ start: Int, _ finish: Int, _ fuel: Int,
                            _ locations: [Int], _ dp: inout [[Int?]]) -> Int {
        guard fuel >= 0 else { return 0 }
        
        if let answer = dp[start][fuel] {
            return answer
        }
        
        var answer = start == finish ? 1 : 0
        
        for destination in locations.indices where destination != start {
            let cost = abs(locations[start] - locations[destination])
            
            answer += depthFirst(destination, finish, fuel - cost, locations, &dp) % mod
            answer %= mod
        }
        
        dp[start][fuel] = answer
        return answer
    }
}
