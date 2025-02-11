//
//  RemoveAllOccurrencesOfASubstring.swift
//  https://leetcode.com/problems/remove-all-occurrences-of-a-substring/
//
//  Created by Erik Radicheski da Silva on 11/02/25.
//

import XCTest

final class RemoveAllOccurrencesOfASubstring: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeOccurrences("daabcbaabcbc", "abc"), "dab")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeOccurrences("axxxxyyyyb", "xy"), "ab")
    }
    
}

private class Solution {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        let part = Array(part)
        var answer = [Character]()
        
        for c in s {
            answer.append(c)
            
            if answer.suffix(part.count) == part {
                answer.removeLast(part.count)
            }
        }
        
        return String(answer)
    }
}
