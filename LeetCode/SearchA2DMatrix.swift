//
//  SearchA2DMatrix.swift
//  https://leetcode.com/problems/search-a-2d-matrix/
//
//  Created by Erik Radicheski da Silva on 04/09/22.
//

import XCTest

class SearchA2DMatrix: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertTrue(solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
        XCTAssertFalse(solution.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))
        
    }

}

private class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var firstRow = 0
        var lastRow = matrix.count - 1
        var middleRow = 0
        
        while firstRow <= lastRow {
            middleRow = (firstRow + lastRow) / 2
            if let minValue = matrix[middleRow].first,
               let maxValue = matrix[middleRow].last {
                if minValue > target {
                    lastRow = middleRow - 1
                } else if maxValue < target {
                    firstRow = middleRow + 1
                } else {
                    break
                }
            }
        }
        
        let row = matrix[middleRow]
        
        var firstColumn = 0
        var lastColumn = row.count - 1
        var middleColumn: Int
        
        while firstColumn <= lastColumn {
            middleColumn = (firstColumn + lastColumn) / 2
            let value = row[middleColumn]
            if value > target {
                lastColumn = middleColumn - 1
            } else if value < target {
                firstColumn = middleColumn + 1
            } else {
                return true
            }
        }
        
        return false
    }
}
