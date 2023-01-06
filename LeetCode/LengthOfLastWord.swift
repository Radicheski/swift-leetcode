//
//  LengthOfLastWord.swift
//  https://leetcode.com/problems/length-of-last-word/
//
//  Created by Erik Radicheski da Silva on 06/01/23.
//

import XCTest

final class LengthOfLastWord: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lengthOfLastWord("Hello World"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lengthOfLastWord("   fly me   to   the moon  "), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.lengthOfLastWord("luffy is still joyboy"), 6)
    }

}

private class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let words = s.split(separator: " ")
        return words.last!.count
    }
}
