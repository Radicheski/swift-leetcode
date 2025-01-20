//
//  FirstCompletelyPaintedRowOrColumn.swift
//  https://leetcode.com/problems/first-completely-painted-row-or-column/description/?envType=daily-question&envId=2025-01-20
//
//  Created by Erik Radicheski da Silva on 20/01/25.
//

import XCTest

final class FirstCompletelyPaintedRowOrColumn: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.firstCompleteIndex([1, 3, 4, 2], [[1, 4], [2, 3]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.firstCompleteIndex([2, 8, 7, 4, 1, 3, 5, 6, 9], [[3, 2, 5], [1, 4, 6], [8, 7, 9]]), 3)
    }
    
}

private class Solution {
    func firstCompleteIndex(_ arr: [Int], _ mat: [[Int]]) -> Int {
        var cells = [Int: (i: Int, j: Int)]()
        
        for (i, row) in mat.enumerated() {
            for (j, col) in row.enumerated() {
                cells[col] = (i, j)
            }
        }
        
        var rows = Array(repeating: mat[0].count, count: mat.count)
        var cols = Array(repeating: mat.count, count: mat[0].count)
        
        for (i, index) in arr.enumerated() {
            let (row, col) = cells[index]!
            
            rows[row] -= 1
            if rows[row] == 0 { return i }
            
            cols[col] -= 1
            if cols[col] == 0 { return i }
        }
        
        return .min
    }
}
