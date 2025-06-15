//
//  MaxDifferenceYouCanGetFromChangingAnInteger.swift
//  https://leetcode.com/problems/max-difference-you-can-get-from-changing-an-integer/
//
//  Created by Erik Radicheski da Silva on 15/06/25.
//

import XCTest

final class MaxDifferenceYouCanGetFromChangingAnInteger: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDiff(555), 888)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDiff(9), 8)
    }
    
}

private class Solution {
    func maxDiff(_ num: Int) -> Int {
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
        
        if numString.starts(with: "0") { return num }
        
        return Int(numString)!
    }
}
