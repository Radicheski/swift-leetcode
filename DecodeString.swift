//
//  DecodeString.swift
//  https://leetcode.com/problems/decode-string/
//
//  Created by Erik Radicheski da Silva on 29/08/22.
//

import XCTest

class DecodeString: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.decodeString("3[a]2[bc]"), "aaabcbc")
        XCTAssertEqual(solution.decodeString("3[a2[c]]"), "accaccacc")
        XCTAssertEqual(solution.decodeString("2[abc]3[cd]ef"), "abcabccdcdcdef")
    }

}

private class Solution {
    func decodeString(_ s: String) -> String {
        var string = s
        
        while let range = string.range(of: "\\d+\\[[a-z]*\\]", options: .regularExpression) {
            let replacementString = convert(string[range])
            string.replaceSubrange(range, with: replacementString)
        }
        
        return string
    }
    
    private func convert(_ s: Substring) -> String {
        var string = s
        string.removeLast()
        
        var strings = string.split(separator: "[").map { String($0) }
        let count = Int(strings[0])
        
        return String(repeating: strings[1], count: count!)
    }
}
