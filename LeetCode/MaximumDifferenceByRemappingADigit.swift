//
//  MaximumDifferenceByRemappingADigit.swift
//  https://leetcode.com/problems/maximum-difference-by-remapping-a-digit/
//
//  Created by Erik Radicheski da Silva on 14/06/25.
//

import XCTest

final class MaximumDifferenceByRemappingADigit: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minMaxDifference(11891), 99009)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minMaxDifference(90), 99)
    }
    
}

private class Solution {
    func minMaxDifference(_ num: Int) -> Int {
        var minimum = Int.max
        var maximum = Int.min
        
        for old in 0 ... 9 {
            for new in 0 ... 9 {
                let newNum = remap(num, old, new)
                minimum = min(minimum, newNum)
                maximum = max(maximum, newNum)
            }
        }
        
        return maximum - minimum
    }
    
    private func remap(_ num: Int, _ old: Int, _ new: Int) -> Int {
        guard (0...9).contains(old) else { return 0 }
        guard (0...9).contains(new) else { return 0 }
        if old == new { return num }
        
        var numString = "\(num)"
        numString = numString.replacingOccurrences(of: "\(old)", with: "\(new)")
        return Int(numString)!
    }
}
