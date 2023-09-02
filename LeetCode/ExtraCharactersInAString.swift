//
//  ExtraCharactersInAString.swift
//  https://leetcode.com/problems/extra-characters-in-a-string/
//
//  Created by Erik Radicheski da Silva on 02/09/23.
//

import XCTest

final class ExtraCharactersInAString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minExtraChar("leetscode", ["leet", "code", "leetcode"]),  1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minExtraChar("sayhelloworld", ["hello", "world"]), 3)
    }

}

private class Solution {
    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        let string = Array(s)
        var memo: [Int?] = string.map { _ in nil }
        let dictionary = Set(dictionary.map(Array.init))
        
        return minExtraChar(0, string, dictionary, &memo)
    }
    
    private func minExtraChar(_ start: Int, _ string: [Character],
                              _ dictionary: Set<[Character]>, _ memo: inout [Int?]) -> Int {
        guard start < string.endIndex else { return 0 }
        
        if let answer = memo[start] {
            return answer
        }
        
        var answer = minExtraChar(start + 1, string, dictionary, &memo) + 1
        for end in start ..< string.endIndex {
            let current = Array(string[start ... end])
            if dictionary.contains(current) {
                answer = min(answer, minExtraChar(end + 1, string, dictionary, &memo))
            }
        }
        
        memo[start] = answer
        return answer
    }
}
