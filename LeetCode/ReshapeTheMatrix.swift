//
//  ReshapeTheMatrix.swift
//  https://leetcode.com/problems/reshape-the-matrix/
//
//  Created by Erik Radicheski da Silva on 03/09/22.
//

import XCTest

class ReshapeTheMatrix: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.matrixReshape([[1, 2], [3, 4]], 1, 4), [[1, 2, 3, 4]])
        XCTAssertEqual(solution.matrixReshape([[1, 2], [3, 4]], 2, 4), [[1, 2], [3, 4]])
    }

}

private class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let originalRow = mat.count
        let originalColumn = mat[0].count
        
        if originalRow * originalColumn != r * c {
            return mat
        }
        
        var result = [[Int]]()
        
        var newRow = [Int]()
        
        for row in mat {
            for column in row {
                newRow.append(column)
                if newRow.count == c {
                    result.append(newRow)
                    newRow.removeAll()
                }
            }
        }
        
        return result
    }
}
