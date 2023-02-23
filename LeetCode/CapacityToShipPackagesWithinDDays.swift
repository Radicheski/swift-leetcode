//
//  CapacityToShipPackagesWithinDDays.swift
//  https://leetcode.com/problems/capacity-to-ship-packages-within-d-days/
//
//  Created by Erik Radicheski da Silva on 22/02/23.
//

import XCTest

final class CapacityToShipPackagesWithinDDays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shipWithinDays([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 5), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shipWithinDays([3, 2, 2, 4, 1, 4], 3), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.shipWithinDays([1, 2, 3, 1, 1], 4), 3)
    }

}

private class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var totalLoad = 0
        var maxLoad = 0
        
        for weight in weights {
            totalLoad += weight
            maxLoad = max(maxLoad, weight)
        }
        
        var left = maxLoad
        var right = totalLoad
        
        while left < right {
            let middle = (left + right) / 2
            
            if daysNeeded(weights, middle) <= days {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
    private func daysNeeded(_ weights: [Int], _ capacity: Int) -> Int {
        var daysNedeed = 1
        var currentLoad = 0
        
        for weight in weights {
            currentLoad += weight
            
            if currentLoad > capacity {
                daysNedeed += 1
                currentLoad = weight
            }
        }
        
        return daysNedeed
    }
}
