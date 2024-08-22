//
//  NumberComplement.swift
//  https://leetcode.com/problems/number-complement/
//
//  Created by Erik Radicheski da Silva on 22/08/24.
//

import XCTest

final class NumberComplement: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findComplement(5), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findComplement(1), 0)
    }
    
}

private class Solution {
    func findComplement(_ num: Int) -> Int {
        var num = num
        let bits = Int.bitWidth - num.leadingZeroBitCount
        
        for i in 0 ..< bits {
            num ^= 1 << i
        }
        
        return num
    }
}
