//
//  SumOfDigitsOfStringAfterConvert.swift
//  https://leetcode.com/problems/sum-of-digits-of-string-after-convert/
//
//  Created by Erik Radicheski da Silva on 03/09/24.
//

import XCTest

final class SumOfDigitsOfStringAfterConvert: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getLucky("iiii", 1), 36)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getLucky("leetcode", 2), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getLucky("zbax", 2), 8)
    }
    
}

private class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var s = String(s.compactMap(\.asciiValue).map { $0 - 96 }.map(String.init).reduce(into: [], +=))
        
        for _ in 0 ..< k {
            s = sumDigits(s)
        }
        
        return Int(s)!
    }
    
    private func sumDigits(_ s: String) -> String {
        return "\(s.compactMap(\.hexDigitValue).reduce(into: 0, +=))"
    }
}
