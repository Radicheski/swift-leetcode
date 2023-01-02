//
//  DetectCapital.swift
//  https://leetcode.com/problems/detect-capital/
//
//  Created by Erik Radicheski da Silva on 02/01/23.
//

import XCTest

final class DetectCapital: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.detectCapitalUse("USA"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.detectCapitalUse("FlaG"))
    }

}

private class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        if word == word.uppercased() {
            return true
        }
        
        let index = String.Index(utf16Offset: 1, in: word)
        
        if word[index...] == word[index...].lowercased() {
            return true
        }
        
        return false
    }
}
