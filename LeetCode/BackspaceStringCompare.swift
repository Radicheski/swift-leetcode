//
//  BackspaceStringCompare.swift
//  https://leetcode.com/problems/backspace-string-compare/
//
//  Created by Erik Radicheski da Silva on 29/08/22.
//

import XCTest

class BackspaceStringCompare: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertTrue(solution.backspaceCompare("ab#c", "ad#c"))
        XCTAssertTrue(solution.backspaceCompare("ab##", "c#d#"))
        XCTAssertFalse(solution.backspaceCompare("a#c", "b"))
    }

}

private class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        return cleanString(s) == cleanString(t)
    }
    
    private func cleanString(_ s: String) -> String {
        var chars = [String.Element]()
        
        for char in s {
            if char == "#" {
                if !chars.isEmpty {
                    chars.removeLast()
                }
            } else {
                chars.append(char)
            }
        }
        
        return String(chars)
    }
}
