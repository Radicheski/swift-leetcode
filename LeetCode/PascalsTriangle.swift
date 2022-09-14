//
//  PascalsTriangle.swift
//  https://leetcode.com/problems/pascals-triangle/
//
//  Created by Erik Radicheski da Silva on 03/09/22.
//

import XCTest

class PascalsTriangle: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.generate(5), [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
    }

    func testExampleB() {
        XCTAssertEqual(solution.generate(1), [[1]])
    }
    
}

private class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        
        if numRows == 2 {
            return [[1], [1, 1]]
        }
        
        var previousTriangle = generate(numRows - 1)
        
        if let lastRow = previousTriangle.last {
            var nextRow = [1]
            
            for index in 1 ..< lastRow.count {
                nextRow.append(lastRow[index] + lastRow[index - 1])
            }
            
            nextRow.append(1)
            
            previousTriangle.append(nextRow)
        }
        
        return previousTriangle
    }
}
