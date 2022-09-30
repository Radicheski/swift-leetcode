//
//  SpiralMatrix2.swift
//  https://leetcode.com/problems/spiral-matrix-ii/
//
//  Created by Erik Radicheski da Silva on 30/09/22.
//

import XCTest

final class SpiralMatrix2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.generateMatrix(3), [[1, 2, 3], [8, 9, 4], [7, 6, 5]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.generateMatrix(1), [[1]])
    }
}

private class Solution {
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        
        var direction = (row: 0, column: 1)
        var position = (row: 0, column: 0)
        
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for i in 1 ... n * n {
            result[position.row][position.column] = i
            let nextPosition = (row: position.row + direction.row, column: position.column + direction.column)
            if (0 ..< n).contains(nextPosition.row) && (0 ..< n).contains(nextPosition.column)
                && result[nextPosition.row][nextPosition.column] == 0 {
                position = nextPosition
            } else {
                direction = rotateClockWise(direction)
                position = (position.row + direction.row, position.column + direction.column)
            }
            
        }
        
        return result
        
    }
    
    private func rotateClockWise(_ vector: (Int, Int)) -> (Int, Int) {
        return (vector.1, -vector.0)
    }
    
}
