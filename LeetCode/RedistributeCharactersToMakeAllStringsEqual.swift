//
//  RedistributeCharactersToMakeAllStringsEqual.swift
//  https://leetcode.com/problems/redistribute-characters-to-make-all-strings-equal/
//
//  Created by Erik Radicheski da Silva on 30/12/23.
//

import XCTest

final class RedistributeCharactersToMakeAllStringsEqual: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.makeEqual(["abc", "aabc", "bc"]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.makeEqual(["ab", "a"]))
    }
}

private class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var count = [Character: Int]()
        
        for word in words {
            for character in word {
                count[character, default: 0] += 1
            }
        }
        
        return count.allSatisfy { $0.value.isMultiple(of: words.count) }
    }
}
