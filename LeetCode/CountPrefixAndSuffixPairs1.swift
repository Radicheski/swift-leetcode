//
//  CountPrefixAndSuffixPairs1.swift
//  https://leetcode.com/problems/count-prefix-and-suffix-pairs-i/
//
//  Created by Erik Radicheski da Silva on 08/01/25.
//

import XCTest

final class CountPrefixAndSuffixPairs1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countPrefixSuffixPairs(["a", "aba", "ababa", "aa"]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countPrefixSuffixPairs(["pa", "papa", "ma", "mama"]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countPrefixSuffixPairs(["abab", "ab"]), 0)
    }
    
}

private class Solution {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        let words = words.map(Array.init)
        var answer = 0
        
        for i in words.indices {
            for j in words.indices {
                if i >= j { continue }
                
                if isPrefixAndSuffix(words[i], words[j]) {
                    answer += 1
                }
            }
        }
        
        return answer
    }
    
    private func isPrefixAndSuffix(_ a: [Character], _ b: [Character]) -> Bool {
        return a[...] == b.prefix(a.count) && a[...] == b.suffix(a.count)
    }
}
