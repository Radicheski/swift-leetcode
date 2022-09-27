//
//  ReverseBits.swift
//  https://leetcode.com/problems/reverse-bits/
//
//  Created by Erik Radicheski da Silva on 27/09/22.
//

import XCTest

final class ReverseBits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = Int("00000010100101000001111010011100", radix: 2)!
        XCTAssertEqual(solution.reverseBits(input), 964176192)
    }
    
    func testExampleB() {
        let input = Int("11111111111111111111111111111101", radix: 2)!
        XCTAssertEqual(solution.reverseBits(input), 3221225471)
    }

}

private class Solution {
    
    func reverseBits(_ n: Int) -> Int {
        var string = String(String(n, radix: 2).reversed())
        string += String(repeating: "0", count: 32 - string.count)
        return Int(String(string), radix: 2)!
    }
    
}
