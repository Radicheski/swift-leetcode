//
//  DiagonalTraverse2.swift
//  https://leetcode.com/problems/diagonal-traverse-ii/description/?envType=daily-question&envId=2023-11-22
//
//  Created by Erik Radicheski da Silva on 22/11/23.
//

import XCTest

final class DiagonalTraverse2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findDiagonalOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), [1, 4, 2, 7, 5, 3, 8, 6, 9])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findDiagonalOrder([[1, 2, 3, 4, 5], [6, 7], [8], [9, 10, 11], [12, 13, 14, 15, 16]]),
                                                  [1, 6, 2, 8, 7, 3, 9, 4, 12, 10, 5, 13, 11, 14, 15, 16])
    }
}

private class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var number = [(sum: Int, row: Int, value: Int)]()
        
        for (i, row) in nums.enumerated() {
            for (j, num) in row.enumerated() {
                number.append((i + j, i, num))
            }
        }
        
        number.sort { $0.sum == $1.sum ? $0.row > $1.row : $0.sum < $1.sum }
        
        return number.map(\.value)
    }
}
