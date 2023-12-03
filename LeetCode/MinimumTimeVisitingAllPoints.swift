//
//  MinimumTimeVisitingAllPoints.swift
//  https://leetcode.com/problems/minimum-time-visiting-all-points/
//
//  Created by Erik Radicheski da Silva on 03/12/23.
//

import XCTest

final class MinimumTimeVisitingAllPoints: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minTimeToVisitAllPoints([[1, 1], [3, 4], [-1, 0]]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minTimeToVisitAllPoints([[3, 2], [-2, 2]]), 5)
    }

}

private class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        guard points.count > 1 else { return 0 }
        
        var answer = 0
        
        for i in 1 ..< points.endIndex {
            answer += max(abs(points[i - 1][0] - points[i][0]),
                          abs(points[i - 1][1] - points[i][1]))
        }
        
        return answer
    }
}
