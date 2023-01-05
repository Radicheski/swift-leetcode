//
//  MinimumNumberOfArrowsToBurstBalloons.swift
//  https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/
//
//  Created by Erik Radicheski da Silva on 05/01/23.
//

import XCTest

final class MinimumNumberOfArrowsToBurstBalloons: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMinArrowShots([[10, 16], [2, 8], [1, 6], [7, 12]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMinArrowShots([[1, 2], [3, 4], [5, 6], [7, 8]]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findMinArrowShots([[1, 2], [2, 3], [3, 4], [4, 5]]), 2)
    }

}

private class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[1] < $1[1] }
        
        var arrows = 0
        var shotPosition = Int.min
        
        for ballon in points {
            if ballon[0] > shotPosition {
                arrows += 1
                shotPosition = ballon[1]
            }
        }
        
        return arrows
    }
}
