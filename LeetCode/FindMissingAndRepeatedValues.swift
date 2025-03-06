//
//  FindMissingAndRepeatedValues.swift
//  https://leetcode.com/problems/find-missing-and-repeated-values/
//
//  Created by Erik Radicheski da Silva on 06/03/25.
//

import XCTest

final class FindMissingAndRepeatedValues: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMissingAndRepeatedValues([[1, 3], [2, 2]]), [2,4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMissingAndRepeatedValues([[9, 1, 7], [8, 9, 2], [3, 4, 6]]), [9, 5])
    }
    
}

private class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var answer = Array(repeating: -1, count: 2)
        
        var count = [Int: Int]()
        
        for row in grid {
            for cell in row {
                count[cell, default: 0] += 1
                
                if count[cell] == 2 {
                    answer[0] = cell
                }
            }
        }
        
        for i in 1 ... count.count + 1 {
            if count[i] == nil {
                answer[1] = i
                break
            }
        }

        return answer
    }
}
