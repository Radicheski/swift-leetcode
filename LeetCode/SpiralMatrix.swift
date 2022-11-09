//
//  SpiralMatrix.swift
//  https://leetcode.com/problems/spiral-matrix/
//
//  Created by Erik Radicheski da Silva on 09/11/22.
//

import XCTest

final class SpiralMatrix: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let output = [1, 2, 3, 6, 9, 8, 7, 4, 5]
        XCTAssertEqual(solution.spiralOrder(input), output)
    }
    
    func testExampleB() {
        let input = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]
        let output = [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
        XCTAssertEqual(solution.spiralOrder(input), output)
    }

}

private class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var visited = matrix.map { $0.map { _ in false } }
        
        var result = [Int]()
        
        var point = (x: 0, y: 0)
        var direction = (dx: 0, dy: 1)
        
        for _ in 0 ..< matrix.count {
            for _ in 0 ..< matrix[0].count {
                if visited[point.x][point.y] == false {
                    result.append(matrix[point.x][point.y])
                    visited[point.x][point.y] = true
                } else {
                    change(&direction)
                }
                
                let nextPoint = next(point, direction)
                if inRange(matrix, nextPoint) == false || visited[nextPoint.x][nextPoint.y] {
                    change(&direction)
                }
                
                point = next(point, direction)
            }
        }
        
        return result
    }
    
    private func inRange(_ matrix: [[Any]], _ point: (x: Int, y: Int)) -> Bool {
        (0 ..< matrix.endIndex).contains(point.x) && (0 ..< matrix[0].endIndex).contains(point.y)
    }
    
    private func change(_ direction: inout (dx: Int, dy: Int)) {
        let dx = direction.dy
        let dy = -direction.dx
        direction = (dx, dy)
    }
    
    private func next(_ point: (x: Int, y: Int), _ direction: (dx: Int, dy: Int)) -> (x: Int, y: Int) {
        (point.x + direction.dx, point.y + direction.dy)
    }
}
