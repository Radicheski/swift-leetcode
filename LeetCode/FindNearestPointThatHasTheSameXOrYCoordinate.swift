//
//  FindNearestPointThatHasTheSameXOrYCoordinate.swift
//  https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/
//
//  Created by Erik Radicheski da Silva on 22/12/22.
//

import XCTest

final class FindNearestPointThatHasTheSameXOrYCoordinate: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nearestValidPoint(3, 4, [[1, 2], [3, 1], [2, 4], [2, 3], [4, 4]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nearestValidPoint(3, 4, [[3, 4]]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.nearestValidPoint(3, 4, [[2, 3]]), -1)
    }

}

private class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var distance = Int.max
        var index = -1
        
        for (currentIndex, point) in points.enumerated() {
            guard point[0] == x || point[1] == y else { continue }
            
            let currentDistance = abs(point[0] - x) + abs(point[1] - y)
            if currentDistance < distance {
                index = currentIndex
                distance = currentDistance
            }
        }
        
        return index
    }
}
