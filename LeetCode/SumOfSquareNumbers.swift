//
//  SumOfSquareNumbers.swift
//  https://leetcode.com/problems/sum-of-square-numbers/
//
//  Created by Erik Radicheski da Silva on 18/06/24.
//

import XCTest

final class SumOfSquareNumbers: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.judgeSquareSum(5))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.judgeSquareSum(3))
    }
    
}

private class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        guard c > 0 else { return true }
        
        for a in 0 ..< c {
            guard a * a <= c else { break }
            
            let bSquare = c - a * a
            
            var left = 0
            var right = bSquare
            
            while left <= right {
                let b = left + (right - left) / 2
                
                guard b * b != bSquare else { return true }
                
                if b * b > bSquare {
                    right = b - 1
                } else {
                    left = b + 1
                }
            }
        }
        
        return false
    }
}
