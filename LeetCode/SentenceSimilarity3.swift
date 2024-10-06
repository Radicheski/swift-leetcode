//
//  SentenceSimilarity3.swift
//  https://leetcode.com/problems/sentence-similarity-iii/
//
//  Created by Erik Radicheski da Silva on 06/10/24.
//

import XCTest

final class SentenceSimilarity3: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.areSentencesSimilar("My name is Haley", "My Haley"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.areSentencesSimilar("of", "A lot of words"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.areSentencesSimilar("Eating right now", "Eating"))
    }
    
}

private class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        var sentence1 = sentence1.components(separatedBy: .whitespaces)
        var sentence2 = sentence2.components(separatedBy: .whitespaces)
        
        if sentence1 == sentence2 { return true }
        
        while sentence1.last == sentence2.last {
            let _ = sentence1.popLast()
            let _ = sentence2.popLast()
        }
        
        while sentence1.first == sentence2.first {
            let _ = sentence1.removeFirst()
            let _ = sentence2.removeFirst()
        }
        
        return sentence1.isEmpty || sentence2.isEmpty
    }
}
