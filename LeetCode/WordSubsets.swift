//
//  WordSubsets.swift
//  https://leetcode.com/problems/word-subsets/
//
//  Created by Erik Radicheski da Silva on 10/01/25.
//

import XCTest

final class WordSubsets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.wordSubsets(["amazon", "apple", "facebook", "google", "leetcode"], ["e", "o"]), ["facebook", "google", "leetcode"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.wordSubsets(["amazon", "apple", "facebook", "google", "leetcode"], ["l", "e"]), ["apple", "google", "leetcode"])
    }
    
}

private class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        let count1 = words1.map(count)
        let count2 = Set(words2.map(count))
        
        var answer = [String]()
        
        for (i, word) in count1.enumerated() {
            var isUniversal = true
            
            for subword in count2 {
                guard isUniversal else { break }
                
                for c in subword {
                    guard let c1 = word[c.key], c.value <= c1 else {
                        isUniversal = false
                        break
                    }
                }
            }
            
            if isUniversal {
                answer.append(words1[i])
            }
        }
        
        return answer
    }
    
    private func count(_ word: String) -> [Character: Int] {
        var count = [Character: Int]()
        
        for character in word {
            count[character, default: 0] += 1
        }
        
        return count
    }
}
