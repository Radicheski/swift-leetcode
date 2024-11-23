//
//  RotatingTheBox.swift
//  https://leetcode.com/problems/rotating-the-box/
//
//  Created by Erik Radicheski da Silva on 23/11/24.
//

import XCTest

final class RotatingTheBox: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.rotateTheBox([["#", ".", "#"]]), [["."], ["#"], ["#"]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.rotateTheBox([["#", ".", "*", "."], ["#", "#", "*", "."]]),
                       [["#","."], ["#","#"], ["*","*"], [".","."]])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.rotateTheBox([["#","#","*",".","*","."], ["#","#","#","*",".","."], ["#","#","#",".","#","."]]),
                       [[".","#","#"], [".","#","#"], ["#","#","*"], ["#","*","."], ["#",".","*"], ["#",".","."]])
    }
    
}

private class Solution {
    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let (m, n) = (box.count, box[0].count)
        var newBox: [[Character]] = Array(repeating: Array(repeating: " ", count: m), count: n)
        
        for i in 0 ..< n {
            for j in 0 ..< m {
                newBox[i][j] = box[m - j - 1][i]
            }
        }
        
        for j in 0 ..< m {
            var bottom = n - 1
            
            for i in (0 ..< n).reversed() {
                if newBox[i][j] == "#" {
                    newBox[i][j] = "."
                    newBox[bottom][j] = "#"
                    bottom -= 1
                }
                if newBox[i][j] == "*" {
                    bottom = i - 1
                }
            }
            
        }
        
        return newBox
    }
}
