//
//  DecodedStringAtIndex.swift
//  https://leetcode.com/problems/decoded-string-at-index/
//
//  Created by Erik Radicheski da Silva on 27/09/23.
//

import XCTest

final class DecodedStringAtIndex: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.decodeAtIndex("leet2code3", 10), "o")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.decodeAtIndex("ha22", 5), "h")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.decodeAtIndex("a2345678999999999999999", 1), "a")
    }

}

private class Solution {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {
        let string = Array(s)
        var index = k
        var size = 0
        
        for character in s {
            if character.isLetter {
                size += 1
            } else if let repetition = character.hexDigitValue {
                size *= repetition
            }
        }
        
        for character in string.reversed() {
            index %= size
            
            guard index > 0 || character.isLetter == false else { return "\(character)" }
            
            if character.isLetter {
                size -= 1
            } else if let repetition = character.hexDigitValue {
                size /= repetition
            }
        }
        
        fatalError()
    }
}
