//
//  MaximalRectangle.swift
//  https://leetcode.com/problems/maximal-rectangle/
//
//  Created by Erik Radicheski da Silva on 12/04/24.
//

import XCTest

final class MaximalRectangle: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximalRectangle([["1", "0", "1", "0", "0"],
                                                  ["1", "0", "1", "1", "1"],
                                                  ["1", "1", "1", "1", "1"],
                                                  ["1", "0", "0", "1", "0"]]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximalRectangle([["0"]]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximalRectangle([["1"]]), 1)
    }

}

private class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        var answer = 0
        var lengths = Array(repeating: 0, count: matrix[0].count + 1)
        
        for row in matrix {
            for (i, number) in row.enumerated() {
                if number == "1" {
                    lengths[i] += 1
                } else {
                    lengths[i] = 0
                }
            }
            
            var stack = [Int]()
            
            for i in 0 ... row.count {
                while let last = stack.last, lengths[i] < lengths[last] {
                    stack.removeLast()
                    let length = lengths[last]
                    let width = stack.isEmpty ? i : i - stack.last! - 1
                    answer = max(answer, length * width)
                }
                
                stack.append(i)
            }
        }
        
        return answer
    }
}
