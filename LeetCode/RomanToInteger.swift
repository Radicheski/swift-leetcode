//
//  RomanToInteger.swift
//  https://leetcode.com/problems/roman-to-integer/
//
//  Created by Erik Radicheski da Silva on 09/08/22.
//

import XCTest

class RomanToInteger: XCTestCase {

    func test() {
        let solution = Solution()

        XCTAssertEqual(3, solution.romanToInt("III"))
        XCTAssertEqual(58, solution.romanToInt("LVIII"))
        XCTAssertEqual(1994, solution.romanToInt("MCMXCIV"))
    }

}

private class Solution {

    private let converter: [Character: Int] = ["I": 1,
                                               "V": 5,
                                               "X": 10,
                                               "L": 50,
                                               "C": 100,
                                               "D": 500,
                                               "M": 1000]

    func romanToInt(_ s: String) -> Int {
        var lastValue = 0
        var number = 0
        for c in s.reversed() {
            if let n = converter[c] {
                if n < lastValue {
                    number -= n
                } else {
                    number += n
                    lastValue = n
                }
            }
        }
        return number
    }

}
