//
//  ReverseString.swift
//  https://leetcode.com/problems/reverse-string/
//
//  Created by Erik Radicheski da Silva on 17/09/22.
//

import XCTest

final class ReverseString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        var input: [Character] = ["h", "e", "l", "l", "o"]
        solution.reverseString(&input)
        XCTAssertEqual(input, ["o", "l", "l", "e", "h"])
    }
    
    func testExampleB() {
        var input: [Character] = ["H", "a", "n", "n", "a", "h"]
        solution.reverseString(&input)
        XCTAssertEqual(input, ["h", "a", "n", "n", "a", "H"])
    }

}

private class Solution {
    
    func reverseString(_ s: inout [Character]) {
        for index in 0 ..< s.count {
            let last = s.removeLast()
            s.insert(last, at: index)
        }
    }
    
}
