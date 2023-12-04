//
//  Largest3SameDigitNumberInString.swift
//  https://leetcode.com/problems/largest-3-same-digit-number-in-string/
//
//  Created by Erik Radicheski da Silva on 04/12/23.
//

import XCTest

final class Largest3SameDigitNumberInString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestGoodInteger("6777133339"), "777")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestGoodInteger("2300019"), "000")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.largestGoodInteger("42352338"), "")
    }
    
}

private class Solution {
    func largestGoodInteger(_ num: String) -> String {
        let num = Array(num)
        var answer = [[Character]]()
        
        var lastDigit: Character?
        var count = 0
        for digit in num {
            if digit == lastDigit {
                count += 1
                if count == 3 {
                    answer.append(Array(repeating: digit, count: 3))
                }
            } else {
                lastDigit = digit
                count = 1
            }
        }
        
        answer.sort { $0[0] > $1[0] }
        return String(answer.first ?? [])
    }
}
