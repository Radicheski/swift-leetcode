//
//  SearchA2DMatrix2.swift
//  https://leetcode.com/problems/search-a-2d-matrix-ii/
//
//  Created by Erik Radicheski da Silva on 01/10/22.
//

import XCTest

final class SearchA2DMatrix2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [[1, 4, 7, 11, 15],
                     [2, 5, 8, 12, 19],
                     [3, 6, 9, 16, 22],
                     [10, 13, 14, 17, 24],
                     [18, 21, 23, 26, 30]]
        XCTAssertTrue(solution.searchMatrix(input, 5))
    }
    
    func testExampleB() {
        let input = [[1, 4, 7, 11, 15],
                     [2, 5, 8, 12, 19],
                     [3, 6, 9, 16, 22],
                     [10, 13, 14, 17, 24],
                     [18, 21, 23, 26, 30]]
        XCTAssertFalse(solution.searchMatrix(input, 20))
    }

}

private class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        
        var possibleRows = [Int]()
        
        for column in 0 ..< m {
            if let min = matrix[column].min(),
               let max = matrix[column].max() {
                if min == target {
                    return true
                } else if max == target {
                    return true
                } else if min < target && target < max {
                    possibleRows.append(column)
                }
            }
        }
        
        var possibleColumns = [Int]()
        
        for column in 0 ..< n {
            let min = matrix[0][column]
            let max = matrix[m - 1][column]
            if min == target {
                return true
            } else if max == target {
                return true
            } else if min < target && target < max {
                possibleColumns.append(column)
            }
        }
        
        for row in possibleRows {
            for column in possibleColumns {
                if matrix[row][column] == target {
                    return true
                }
            }
        }
        
        return false
    }
}
