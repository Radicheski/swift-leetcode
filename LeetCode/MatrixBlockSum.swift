//
//  MatrixBlockSum.swift
//  https://leetcode.com/problems/matrix-block-sum/
//
//  Created by Erik Radicheski da Silva on 12/12/22.
//

import XCTest

final class MatrixBlockSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let output = [[12, 21, 16], [27, 45, 33], [24, 39, 28]]
        XCTAssertEqual(solution.matrixBlockSum(input, 1), output)
    }
    
    func testExampleB() {
        let input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let output =  [[45, 45, 45], [45, 45, 45], [45, 45, 45]]
        XCTAssertEqual(solution.matrixBlockSum(input, 2), output)
    }

}

private class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        var sum = Array(repeating: Array(repeating: 0, count: mat[0].count + 1), count: mat.count + 1)
        
        for (rowIndex, rowValue) in mat.enumerated() {
            for (columnIndex, columnValue) in rowValue.enumerated() {
                sum[rowIndex + 1][columnIndex + 1] = sum[rowIndex + 1][columnIndex] + sum[rowIndex][columnIndex + 1] + columnValue - sum[rowIndex][columnIndex]
            }
        }
        
        var result = mat.map { $0.map { _ in 0 } }
        
        for row in 0 ..< mat.endIndex {
            for column in 0 ..< mat[row].endIndex {
                let row1 = max(0, row - k)
                let row2 = min(mat.count - 1, row + k)
                
                let col1 = max(0, column - k)
                let col2 = min(mat[row].count - 1, column + k)
                
                result[row][column] = sum[row2 + 1][col2 + 1] - sum[row1][col2 + 1] - sum[row2 + 1][col1] + sum[row1][col1]
            }
        }
        
        return result
    }
}
