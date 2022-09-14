//
//  Ransom Note.swift
//  https://leetcode.com/problems/ransom-note/
//
//  Created by Erik Radicheski da Silva on 09/08/22.
//

import XCTest

class RansomNote: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertFalse(solution.canConstruct("a", "b"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canConstruct("aa", "ab"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.canConstruct("aa", "aab"))
    }

}

private class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazine = magazine

        for character in ransomNote {
            guard let index = magazine.firstIndex(of: character) else { return false }
            magazine.remove(at: index)
        }

        return true
    }

}
