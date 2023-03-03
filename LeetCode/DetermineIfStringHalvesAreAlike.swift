//
//  DetermineIfStringHalvesAreAlike.swift
//  https://leetcode.com/problems/determine-if-string-halves-are-alike/
//
//  Created by Erik Radicheski da Silva on 03/03/23.
//

import XCTest

final class DetermineIfStringHalvesAreAlike: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.halvesAreAlike("book"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.halvesAreAlike("textbook"))
    }

}

private class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels = Array("aeiouAEIOU")
        let s = Array(s)
        
        let halfIndex = s.endIndex / 2
        
        var vowelCount = 0
        
        for (index, character) in s.enumerated() {
            guard vowels.contains(character) else { continue }
            vowelCount += index < halfIndex ? 1 : -1
        }
        
        return vowelCount == 0
    }
}
