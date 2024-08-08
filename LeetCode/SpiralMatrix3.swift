//
//  SpiralMatrix3.swift
//  https://leetcode.com/problems/spiral-matrix-iii/
//
//  Created by Erik Radicheski da Silva on 08/08/24.
//

import XCTest

final class SpiralMatrix3: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.spiralMatrixIII(1, 4, 0, 0), [[0, 0], [0, 1], [0, 2], [0, 3]])
    }
    
    func testExmapleB() {
        XCTAssertEqual(solution.spiralMatrixIII(5, 6, 1, 4), [[1, 4], [1, 5], [2, 5], [2, 4], [2, 3],
                                                              [1, 3], [0, 3], [0, 4], [0, 5], [3, 5],
                                                              [3, 4], [3, 3], [3, 2], [2, 2], [1, 2],
                                                              [0, 2], [4, 5], [4, 4], [4, 3], [4, 2],
                                                              [4, 1], [3, 1], [2, 1], [1, 1], [0, 1],
                                                              [4, 0], [3, 0], [2, 0], [1, 0], [0, 0]])
    }
    
}

private class Solution {
    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ rStart: Int, _ cStart: Int) -> [[Int]] {
        let dir: [(dx: Int, dy: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        var traversed = Array(repeating: [Int](), count: rows * cols)
        var index = 0
        
        var step = 1
        var direction = 0
        
        var row = rStart
        var col = cStart
        
        while index < rows * cols {
            for i in 0 ..< 2 {
                for j in 0 ..< step {
                    if (0 ..< rows).contains(row) && (0 ..< cols).contains(col) {
                        traversed[index] = [row, col]
                        index += 1
                    }
                    
                    row += dir[direction].dx
                    col += dir[direction].dy
                }
                
                direction += 1
                direction %= 4
            }
            
            step += 1
        }
        
        return traversed
    }
}
