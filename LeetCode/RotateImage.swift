//
//  RotateImage.swift
//  https://leetcode.com/problems/rotate-image/
//
//  Created by Erik Radicheski da Silva on 30/09/22.
//

import XCTest

final class RotateImage: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        var input = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        solution.rotate(&input)
        XCTAssertEqual(input, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    }
    
    func testExampleB() {
        var input = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
        solution.rotate(&input)
        XCTAssertEqual(input, [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]])
    }
    
}

private class Solution {
    
    func rotate(_ matrix: inout [[Int]]) {
        
        let n = matrix.count
        
        for i in 0 ..< n / 2 {
            
            for j in i ..< n - i - 1 {
                
                let temp = matrix[i][j]
                
                matrix[i][j] = matrix[n - j - 1][i]
                matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
                matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
                matrix[j][n - i - 1] = temp
                
            }
            
        }
        
    }
    
}
