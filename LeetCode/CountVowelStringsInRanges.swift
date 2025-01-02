//
//  CountVowelStringsInRanges.swift
//  https://leetcode.com/problems/count-vowel-strings-in-ranges/
//
//  Created by Erik Radicheski da Silva on 02/01/25.
//

import XCTest

final class CountVowelStringsInRanges: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.vowelStrings(["aba", "bcb", "ece", "aa", "e"], [[0, 2], [1, 4], [1, 1]]), [2, 3, 0])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.vowelStrings(["a", "e", "i"], [[0, 2], [0, 1], [2, 2]]), [3, 2, 1])
    }
    
}

private class Solution {
    
    private let vowels: Set<Character?> = Set("aeiou")
    
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let words = words.map { vowels.contains($0.first) && vowels.contains($0.last) ? 1 : 0 }
        var prefix = Array(repeating: 0, count: words.count + 1)
        
        for i in 1 ... words.endIndex {
            prefix[i] = prefix[i - 1] + words[i - 1]
        }
        
        var answer = Array(repeating: 0, count: queries.count)
        
        for i in queries.indices {
            answer[i] = prefix[queries[i][1] + 1] - prefix[queries[i][0]]
        }
        
        return answer
    }
}
