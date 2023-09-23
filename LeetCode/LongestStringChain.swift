//
//  LongestStringChain.swift
//  https://leetcode.com/problems/longest-string-chain/
//
//  Created by Erik Radicheski da Silva on 23/09/23.
//

import XCTest

final class LongestStringChain: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestStrChain(["a", "b", "ba", "bca", "bda", "bdca"]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestStrChain(["xbc", "pcxbcf", "xb", "cxbc", "pcxbc"]), 5)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.longestStrChain(["abcd", "dbqca"]), 1)
    }

}

private class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var dp = [Int: [[Character]: Int]]()
        
        let words = words.map(Array.init).sorted(by: { $0.count < $1.count } )
        
        var maximumLength = 1
        
        for word in words {
            guard let previousWords = dp[word.count - 1] else {
                dp[word.count, default: [:]][word] = 1
                continue
            }
            
            var currentLength = 1
            
            for i in word.indices {
                var previousWord = word
                previousWord.remove(at: i)
                
                if let previousLength = previousWords[previousWord] {
                    currentLength = max(currentLength, 1 + previousLength)
                }
            }
            
            dp[word.count, default: [:]][word] = currentLength
            maximumLength = max(maximumLength, currentLength)
        }
        
        return maximumLength
    }
}
