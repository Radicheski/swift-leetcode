//
//  MultiplyStrings.swift
//  https://leetcode.com/problems/multiply-strings/
//
//  Created by Erik Radicheski da Silva on 05/10/22.
//

import XCTest

final class MultiplyStrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.multiply("2", "3"), "6")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.multiply("123", "456"), "56088")
    }

}

private class Solution {
    
    func multiply(_ num1: String, _ num2: String) -> String {
        var digits = Array(repeating: 0, count: num1.count + num2.count)
        
        for (index1, digit1) in num1.reversed().enumerated() {
            for (index2, digit2) in num2.reversed().enumerated() {
                if let ascii1 = digit1.asciiValue,
                   let ascii2 = digit2.asciiValue {
                    let partialResult = Int(ascii1 - 48) * Int(ascii2 - 48)
                    digits[index1 + index2] += partialResult
                }
            }
        }
        
        for index in 0 ..< digits.count {
            let digit = digits[index]
            if digit > 9 {
                digits[index + 1] += digit / 10
                digits[index] = digit % 10
            }
        }
        
        var result = digits.reversed().map(String.init).joined()
        
        while result.hasPrefix("0") {
            result.removeFirst()
        }
        
        return result.isEmpty ? "0" : result
    }
    
}
