//
//  WidestVerticalAreaBetweenTwoPointsContainingNoPoints.swift
//  https://leetcode.com/problems/widest-vertical-area-between-two-points-containing-no-points/
//
//  Created by Erik Radicheski da Silva on 21/12/23.
//

import XCTest

final class WidestVerticalAreaBetweenTwoPointsContainingNoPoints: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxWidthOfVerticalArea([[8, 7], [9, 9], [7, 4], [9, 7]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxWidthOfVerticalArea([[3, 1], [9, 0], [1, 0], [1, 4], [5, 3], [8, 8]]), 3)
    }
    
}

private class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[0] < $1[0] }
        
        var answer = Int.min
        for i in 1 ..< points.endIndex {
            answer = max(answer, points[i][0] - points[i - 1][0])
        }
        
        return answer
    }
}
