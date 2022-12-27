//
//  MergeStringsAlternately.swift
//  https://leetcode.com/problems/merge-strings-alternately/
//
//  Created by Erik Radicheski da Silva on 27/12/22.
//

import XCTest

final class MergeStringsAlternately: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mergeAlternately("abc", "pqr"), "apbqcr")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mergeAlternately("ab", "pqrs"), "apbqrs")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.mergeAlternately("abcd", "pq"), "apbqcd")
    }
    
}

private class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = [Character]()
        
        var word1 = Array(word1)
        var word2 = Array(word2)
        
        while word1.isEmpty == false && word2.isEmpty == false {
            result.append(word1.removeFirst())
            result.append(word2.removeFirst())
        }
        
        result.append(contentsOf: word1)
        result.append(contentsOf: word2)
        
        return String(result)
    }
}
