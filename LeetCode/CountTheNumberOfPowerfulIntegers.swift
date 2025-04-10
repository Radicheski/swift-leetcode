//
//  CountTheNumberOfPowerfulIntegers.swift
//  https://leetcode.com/problems/count-the-number-of-powerful-integers/
//
//  Created by Erik Radicheski da Silva on 10/04/25.
//

import XCTest

final class CountTheNumberOfPowerfulIntegers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfPowerfulInt(1, 6000, 5, "124"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfPowerfulInt(15, 215, 6, "10"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfPowerfulInt(1000, 2000, 4, "3000"), 0)
    }
    
}

private class Solution {
    func numberOfPowerfulInt(_ start: Int, _ finish: Int, _ limit: Int, _ s: String) -> Int {
        let startStr = String(start - 1)
        let finishStr = String(finish)
        return calculate(finishStr, s, limit) - calculate(startStr, s, limit)
    }

    private func calculate(_ x: String, _ s: String, _ limit: Int) -> Int {
        if x.count < s.count {
            return 0
        }
        if x.count == s.count {
            return x >= s ? 1 : 0
        }

        let suffixStart = x.index(x.endIndex, offsetBy: -s.count)
        let suffix = String(x[suffixStart...])
        var count = 0
        let preLen = x.count - s.count
        let xChars = Array(x)

        for i in 0..<preLen {
            let digit = Int(String(xChars[i]))!
            if limit < digit {
                count += Int(pow(Double(limit + 1), Double(preLen - i)))
                return count
            }
            count += Int(digit) * Int(pow(Double(limit + 1), Double(preLen - 1 - i)))
        }

        if suffix >= s {
            count += 1
        }

        return count
    }
}
