//
//  WordBreak2.swift
//  https://leetcode.com/problems/word-break-ii/
//
//  Created by Erik Radicheski da Silva on 25/05/24.
//

import XCTest

final class WordBreak2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"]), ["cats and dog", "cat sand dog"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"]), ["pine apple pen apple", "pineapple pen apple", "pine applepen apple"])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]), [])
    }
    
}

private class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let wordDict = Set(wordDict)
        let s = Array(s)
        
        var memo = [ArraySlice<Character>: [String]]()
        memo[.init()] = [""]
        
        return wordBreak(s[0...], wordDict, &memo)
    }
    
    private func wordBreak(_ s: ArraySlice<Character>, _ wordDict: Set<String>, _ memo: inout [ArraySlice<Character>: [String]]) -> [String] {
        if let answer = memo[s] {
            return answer
        }
        
        var answer = [String]()
        
        if wordDict.contains(String(s)) {
            answer.append(String(s))
        }
        
        for i in 1 ..< s.count {
            let prefix = String(s.prefix(i))
            
            guard wordDict.contains(prefix) else { continue }
            
            let suffix = wordBreak(s.suffix(s.count - i), wordDict, &memo)
            
            guard suffix.isEmpty == false else { continue }
            
            answer.append(contentsOf: suffix.map { "\(prefix) \($0)" })
        }
        
        memo[s] = answer
        return answer
    }
}
