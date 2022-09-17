//
//  ReverseWordsInAString3.swift
//  https://leetcode.com/problems/reverse-words-in-a-string-iii/
//
//  Created by Erik Radicheski da Silva on 17/09/22.
//

import XCTest

final class ReverseWordsInAString3: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = "Let's take LeetCode contest"
        let output = "s'teL ekat edoCteeL tsetnoc"
        XCTAssertEqual(solution.reverseWords(input), output)
    }
    
    func testExampleB() {
        let input = "God Ding"
        let output = "doG gniD"
        XCTAssertEqual(solution.reverseWords(input), output)
    }

}

private class Solution {
    
    func reverseWords(_ s: String) -> String {
        let split = s.split(separator: " ")
        let rev = split.map { $0.reversed() }
        return String(rev.joined(separator: " "))
    }
    
}
