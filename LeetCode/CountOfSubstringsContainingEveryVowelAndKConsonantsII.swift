//
//  CountOfSubstringsContainingEveryVowelAndKConsonantsII.swift
//  https://leetcode.com/problems/count-of-substrings-containing-every-vowel-and-k-consonants-ii/
//
//  Created by Erik Radicheski da Silva on 10/03/25.
//

import XCTest

final class CountOfSubstringsContainingEveryVowelAndKConsonantsII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countOfSubstrings("aeioqq", 1), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countOfSubstrings("aeiou", 0), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countOfSubstrings("ieaouqqieaouqq", 1), 3)
    }
    
}

private class Solution {
    
    private let vowels = Set("aeiou")
    
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        let word = Array(word)
        var start = 0
        var end = 0
        var vowelCount = [Character: Int]()
        var consoantCount = 0
        var count = 0
        
        var nextConsoant = Array(repeating: 0, count: word.count)
        var nextConsoantIndex = word.count
        for i in word.indices.reversed() {
            nextConsoant[i] = nextConsoantIndex
            if vowels.contains(word[i]) { continue }
            nextConsoantIndex = i
        }
        
        while end < word.endIndex {
            if vowels.contains(word[end]) {
                vowelCount[word[end], default: 0] += 1
            } else {
                consoantCount += 1
            }
            
            while consoantCount > k {
                if vowels.contains(word[start]) {
                    vowelCount[word[start], default: 0] -= 1
                    if vowelCount[word[start]] == 0 {
                        vowelCount[word[start]] = nil
                    }
                } else {
                    consoantCount -= 1
                }
                
                start += 1
            }
            
            while start < word.endIndex && vowelCount.count == 5 && consoantCount == k {
                count += nextConsoant[end] - end
                if vowels.contains(word[start]) {
                    vowelCount[word[start], default: 0] -= 1
                    if vowelCount[word[start]] == 0 {
                        vowelCount[word[start]] = nil
                    }
                } else {
                    consoantCount -= 1
                }
                
                start += 1
            }
            
            end += 1
        }
        
        return count
    }
}
