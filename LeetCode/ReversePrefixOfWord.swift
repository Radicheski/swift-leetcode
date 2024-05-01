//
//  ReversePrefixOfWord.swift
//  https://leetcode.com/problems/reverse-prefix-of-word/
//
//  Created by Erik Radicheski da Silva on 01/05/24.
//

import XCTest

final class ReversePrefixOfWord: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.reversePrefix("abcdefd", "d"), "dcbaefd")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.reversePrefix("xyxzxe", "z"), "zxyxxe")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.reversePrefix("abcd", "z"), "abcd")
    }
    
}

private class Solution {
    func reversePrefix(_ word: String, _ ch: Character) -> String {
        var word = Array(word)
        
        guard let index = word.firstIndex(of: ch) else { return String(word) }
        
        return String(word[0 ... index].reversed() + word[(index + 1)...])
    }
}
