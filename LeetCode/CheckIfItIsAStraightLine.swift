//
//  CheckIfItIsAStraightLine.swift
//  https://leetcode.com/problems/check-if-it-is-a-straight-line/
//
//  Created by Erik Radicheski da Silva on 24/12/22.
//

import XCTest

final class CheckIfItIsAStraightLine: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkStraightLine([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.checkStraightLine([[1, 1], [2, 2], [3, 4], [4, 5], [5, 6], [7, 7]]))
    }

}

private class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let coordinates = coordinates.sorted { $0[0] < $1[0] }
        
        let origin = coordinates[0]
        let pointA = coordinates[1]
        
        let baseX = pointA[0] - origin[0]
        let baseY = pointA[1] - origin[1]
        
        for point in coordinates[2...] {
            let dx = point[0] - origin[0]
            let dy = point[1] - origin[1]
            guard dx * baseY == dy * baseX else {
                return false
            }
        }
        
        return true
    }
}
