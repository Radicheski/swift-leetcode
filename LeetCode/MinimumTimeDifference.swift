//
//  MinimumTimeDifference.swift
//  https://leetcode.com/problems/minimum-time-difference/
//
//  Created by Erik Radicheski da Silva on 16/09/24.
//

import XCTest

final class MinimumTimeDifference: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMinDifference(["23:59", "00:00"]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMinDifference(["00:00", "23:59", "00:00"]), 0)
    }
    
}

private class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        var timePoints = timePoints.map(inMinutes).sorted()
        timePoints.append(timePoints[0] + 1440)
        
        var answer = Int.max
        
        for i in 1 ..< timePoints.endIndex {
            answer = min(answer, timePoints[i] - timePoints[i - 1])
        }
        
        return answer
    }
    
    private func inMinutes(_ time: String) -> Int {
        time.split(separator: ":").compactMap { Int($0) }.reduce(into: 0) { $0 = 60 * $0 + $1 }
    }
}
