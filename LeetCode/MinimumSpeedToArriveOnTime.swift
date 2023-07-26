//
//  MinimumSpeedToArriveOnTime.swift
//  https://leetcode.com/problems/minimum-speed-to-arrive-on-time/
//
//  Created by Erik Radicheski da Silva on 26/07/23.
//

import XCTest

final class MinimumSpeedToArriveOnTime: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSpeedOnTime([1, 3, 2], 6), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSpeedOnTime([1, 3, 2], 2.7), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSpeedOnTime([1, 3, 2], 1.9), -1)
    }

}

private class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        var left = 1
        var right = 10_000_000
        
        var minimumSpeed = -1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            var time = 0.0
            
            for i in 0 ..< dist.endIndex - 1 {
                time += Double(dist[i] / middle) + (dist[i].isMultiple(of: middle) ? 0 : 1)
            }
            
            time += Double(dist.last!) / Double(middle)
            
            if time <= hour {
                if minimumSpeed == -1 {
                    minimumSpeed = middle
                } else {
                    minimumSpeed = min(minimumSpeed, middle)
                }
                
                right = middle - 1
            } else {
                left = middle + 1
            }
                           
        }
        
        return minimumSpeed
    }
}
