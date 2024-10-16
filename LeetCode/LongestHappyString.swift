//
//  LongestHappyString.swift
//  https://leetcode.com/problems/longest-happy-string/
//
//  Created by Erik Radicheski da Silva on 16/10/24.
//

import XCTest

final class LongestHappyString: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestDiverseString(1, 1, 7), "ccaccbcc")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestDiverseString(7, 1, 0), "aabaa")
    }
    
}

private class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var (a, b, c) = (a, b, c)
        var current = Array(repeating: 0, count: 3)
        var answer = [Character]()
        
        for _ in 0 ..< (a + b + c) {
            if (a >= max(b, c) && current[0] < 2)
                || (a > 0 && (current[1] == 2 || current[2] == 2)) {
                answer.append("a")
                a -= 1
                current[0] += 1
                current[1] = 0
                current[2] = 0
            } else if (b >= max(a, c) && current[1] < 2)
                || (b > 0 && (current[0] == 2 || current[2] == 2)) {
                answer.append("b")
                b -= 1
                current[1] += 1
                current[0] = 0
                current[2] = 0
            } else if (c >= max(a, b) && current[2] < 2)
                || (c > 0 && (current[0] == 2 || current[1] == 2)) {
                answer.append("c")
                c -= 1
                current[2] += 1
                current[0] = 0
                current[1] = 0
            }
        }
        
        return String(answer)
    }
}
