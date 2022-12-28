//
//  VerifyingAnAlienDictionary.swift
//  https://leetcode.com/problems/verifying-an-alien-dictionary/
//
//  Created by Erik Radicheski da Silva on 28/12/22.
//

import XCTest

final class VerifyingAnAlienDictionary: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isAlienSorted(["word", "world", "row"], "worldabcefghijkmnpqstuvxyz"))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.isAlienSorted(["apple", "app"], "abcdefghijklmnopqrstuvwxyz"))
    }

}

private class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let words = words.map { Array($0) }
        let order = Array(order)
        
        for index in 1 ..< words.endIndex {
            
            let minimumLength = min(words[index - 1].count, words[index].count)
            
            for position in 0 ..< minimumLength {
                
                let firstIndex = order.firstIndex(of: words[index - 1][position])!
                let secondIndex = order.firstIndex(of: words[index][position])!
                
                if firstIndex < secondIndex {
                    break
                } else if firstIndex > secondIndex {
                    return false
                }
            }
            
            if words[index][..<minimumLength] == words[index - 1][..<minimumLength]
                && words[index].count < words[index - 1].count {
                return false
            }
        }
        
        return true
    }
}
