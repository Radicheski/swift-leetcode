//
//  KClosestPointsToOrigin.swift
//  https://leetcode.com/problems/k-closest-points-to-origin/
//
//  Created by Erik Radicheski da Silva on 18/10/22.
//

import XCTest

final class KClosestPointsToOrigin: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.kClosest([[1, 3], [-2, 2]], 1)
        let expectedOutput = Set<[[Int]]>(arrayLiteral: [[-2, 2]])
        XCTAssertTrue(expectedOutput.contains(output))
    }
    
    func testExampleB() {
        let output = solution.kClosest([[3, 3], [5, -1], [-2, 4]], 2)
        let expectedOutput = Set<[[Int]]>(arrayLiteral: [[3, 3], [-2, 4]])
        XCTAssertTrue(expectedOutput.contains(output))
    }

}

private class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        points.sorted { distanceSquared($0) < distanceSquared($1) }
            .dropLast(points.count - k)
    }
    
    private func distanceSquared(_ point: [Int]) -> Int {
        assert(point.count == 2)
        return point[0] * point[0] + point[1] * point[1]
    }
}
