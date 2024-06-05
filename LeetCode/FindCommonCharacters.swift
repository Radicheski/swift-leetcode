//
//  FindCommonCharacters.swift
//  https://leetcode.com/problems/find-common-characters/
//
//  Created by Erik Radicheski da Silva on 05/06/24.
//

import XCTest

final class FindCommonCharacters: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.commonChars( ["bella", "label", "roller"]), ["e", "l", "l"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.commonChars(["cool", "lock", "cook"]), ["c", "o"])
    }
    
}

private class Solution {
    func commonChars(_ words: [String]) -> [String] {
        guard words.count > 1 else { return Array(words[0]).map(String.init) }
        
        var letters = Dictionary(words[0].map { ($0, 1) }, uniquingKeysWith: +)
        
        for word in words.dropFirst(1) {
            var count = Dictionary(word.map { ($0, 1) }, uniquingKeysWith: +)
            
            letters = letters.filter { count[$0.key] != nil }
            count = count.filter { letters[$0.key] != nil }
            
            letters.merge(count, uniquingKeysWith: min)
        }
        
        return letters.flatMap { Array(repeating: $0.key, count: $0.value) }.map(String.init)
    }
}
