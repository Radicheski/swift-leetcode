//
//  NextGreaterElement3.swift
//  https://leetcode.com/problems/next-greater-element-iii/
//
//  Created by Erik Radicheski da Silva on 10/01/23.
//

import XCTest

final class NextGreaterElement3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nextGreaterElement(12), 21)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nextGreaterElement(21), -1)
    }

}

private class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var digits = Array("\(n)").compactMap { Int("\($0)") }
        
        var i = digits.endIndex - 1
        
        while i - 1 >= 0 && digits[i] <= digits[i - 1] {
            i -= 1
        }
        
        guard i > 0 else { return -1 }
        
        var j = i
        while j + 1 < digits.endIndex && digits[j + 1] > digits[i - 1] {
            j += 1
        }
        
        (digits[i - 1], digits[j]) = (digits[j], digits[i - 1])
        
        let trailingDigits = digits[i...].sorted()
        
        digits.removeLast(digits.count - i)
        digits.append(contentsOf: trailingDigits)
        
        let result = digits.reduce(into: 0) { $0 = $0 * 10 + $1 }
        
        return result <= Int32.max ? result : -1
    }
}
