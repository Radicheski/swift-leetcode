//
//  FindValidMatrixGivenRowAndColumnSums.swift
//  https://leetcode.com/problems/find-valid-matrix-given-row-and-column-sums/
//
//  Created by Erik Radicheski da Silva on 20/07/24.
//

import XCTest

final class FindValidMatrixGivenRowAndColumnSums: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.restoreMatrix([3, 8], [4, 7]), [[3, 0], [1, 7]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.restoreMatrix([5, 7, 10], [8, 6, 8]), [[0, 5, 0], [6, 1, 0], [2, 0, 8]])
    }
    
}

private class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: 0, count: colSum.count), count: rowSum.count)
        
        var rows = rowSum.enumerated().sorted { $0.element > $1.element }
        var columns = colSum.enumerated().sorted { $0.element > $1.element }
        
        while rows.isEmpty == false || columns.isEmpty == false {
            while rows.last?.element == 0 {
                let _ = rows.popLast()
            }
            
            while columns.last?.element == 0 {
                let _ = columns.popLast()
            }
            
            if var row = rows.popLast(), var column = columns.popLast() {
                if row.element < column.element {
                    matrix[row.offset][column.offset] = row.element
                    column.element -= row.element
                    columns.append(column)
                } else {
                    matrix[row.offset][column.offset] = column.element
                    row.element -= column.element
                    rows.append(row)
                }
            }
        }
        
        return matrix
    }
}
