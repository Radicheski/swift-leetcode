//
//  MinimumTimeToCompleteTrips.swift
//  https://leetcode.com/problems/minimum-time-to-complete-trips/
//
//  Created by Erik Radicheski da Silva on 07/03/23.
//

import XCTest

final class MinimumTimeToCompleteTrips: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumTime([1, 2, 3], 5), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumTime([2], 1), 2)
    }
    
}

private class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var left = 1
        var right = time.max()! * totalTrips
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if time.map( { mid / $0 } ).reduce(into: 0, +=) >= totalTrips {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
