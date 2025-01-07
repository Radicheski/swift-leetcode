//
//  StringMatchingInAnArray.swift
//  https://leetcode.com/problems/string-matching-in-an-array/
//
//  Created by Erik Radicheski da Silva on 07/01/25.
//

import XCTest

final class StringMatchingInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.stringMatching(["mass", "as", "hero", "superhero"]), ["as", "hero"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.stringMatching(["leetcode", "et", "code"]), ["et", "code"])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.stringMatching(["blue", "green", "bu"]), [])
    }
    
}

private class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        let words = words.map(Array.init)
        var answer = Set<[Character]>()
        
        for i in words.indices {
            for j in words.indices {
                if i == j { continue }
                
                let subWord = words[i]
                let superWord = words[j]
                
                for k in superWord.indices {
                    var isSubstring = true
                    
                    for l in subWord.indices {
                        if k + l >= superWord.count || superWord[k + l] != subWord[l] {
                            isSubstring = false
                            break
                        }
                    }
                    
                    if isSubstring {
                        answer.insert(words[i])
                        break
                    }
                }
            }
        }
        
        return answer.map { String($0) }
    }
}
