//
//  DetermineWhetherMatrixCanBeObtainedByRotation.swift
//  https://leetcode.com/problems/determine-whether-matrix-can-be-obtained-by-rotation/
//
//  Created by Erik Radicheski da Silva on 07/01/23.
//

import XCTest

final class DetermineWhetherMatrixCanBeObtainedByRotation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.findRotation([[0, 1], [1, 0]], [[1, 0], [0, 1]]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.findRotation([[0, 1], [1, 1]], [[1, 0], [0, 1]]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.findRotation([[0, 0, 0], [0, 1, 0], [1, 1, 1]],
                                            [[1, 1, 1], [0, 1, 0], [0, 0, 0]]))
    }

}

private class Solution {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var mat = mat
        
        for _ in 0 ..< 3 {
            guard mat != target else { return true }
            
            rotate(&mat)
        }
        
        return mat == target
    }
    
    private func rotate(_ mat: inout[[Int]]) {
        let n = mat.count
        
        for i in 0 ..< n / 2 {
            
            for j in i ..< n - i - 1 {
                
                let temp = mat[i][j]
                
                mat[i][j] = mat[n - j - 1][i]
                mat[n - j - 1][i] = mat[n - i - 1][n - j - 1]
                mat[n - i - 1][n - j - 1] = mat[j][n - i - 1]
                mat[j][n - i - 1] = temp
                
            }
            
        }
    }
}
