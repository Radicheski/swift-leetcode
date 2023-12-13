//
//  SpecialPositionsInABinaryMatrix.swift
//  https://leetcode.com/problems/special-positions-in-a-binary-matrix/
//
//  Created by Erik Radicheski da Silva on 13/12/23.
//

import XCTest

final class SpecialPositionsInABinaryMatrix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSpecial([[1, 0, 0], [0, 0, 1], [1, 0, 0]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSpecial([[1, 0, 0], [0, 1, 0], [0, 0,  1]]), 3)
    }
    
}

private class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        let m = mat.count
        let n = mat[0].count
        
        var answer = 0
        
        var row = Array(repeating: 0, count: m)
        var col = Array(repeating: 0, count: n)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                row[i] += mat[i][j]
                col[j] += mat[i][j]
            }
        }
        
        for i in 0 ..< m where row[i] == 1 {
            for j in 0 ..< n where col[j] == 1 {
                answer += mat[i][j]
            }
        }
        
        return answer
    }
}
