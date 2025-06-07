//
//  LexicographicallyMinimumStringAfterRemovingStars.swift
//  https://leetcode.com/problems/lexicographically-minimum-string-after-removing-stars/
//
//  Created by Erik Radicheski da Silva on 07/06/25.
//

import XCTest

final class LexicographicallyMinimumStringAfterRemovingStars: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.clearStars("aaba*"), "aab")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.clearStars("abc"), "abc")
    }
    
}

private class Solution {
    func clearStars(_ s: String) -> String {
        var count = [Character: [Int]]()
        var s = Array(s)

        for i in s.indices {
            if s[i] != "*" {
                count[s[i], default: []].append(i)
            } else {
                for c in "abcdefghijklmnopqrstuvwxyz" {
                    if let indexToRemove = count[c]?.popLast() {
                        s[indexToRemove] = "*"
                        break
                    }
                }
            }
        }

        return String(s.filter { $0 != "*" })
    }
}
