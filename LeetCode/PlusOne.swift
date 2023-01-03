//
//  PlusOne.swift
//  https://leetcode.com/problems/plus-one/
//
//  Created by Erik Radicheski da Silva on 03/01/23.
//

import XCTest

final class PlusOne: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.plusOne([1, 2, 3]), [1, 2, 4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.plusOne([4, 3, 2, 1]), [4, 3, 2, 2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.plusOne([9]), [1, 0])
    }

}

private class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        
        digits[digits.endIndex - 1] += 1
        
        for index in digits.indices.reversed() {
            guard digits[index] > 9 else { continue }
            
            if index == 0 {
                digits.insert(digits[index] / 10, at: 0)
                digits[index + 1] %= 10
            } else {
                digits[index - 1] += digits[index] / 10
                digits[index] %= 10
            } 
        }
        
        return digits
    }
}
