//
//  UniqueSubstringsInWraparoundString.swift
//  https://leetcode.com/problems/unique-substrings-in-wraparound-string/
//
//  Created by Erik Radicheski da Silva on 18/02/23.
//

import XCTest

final class UniqueSubstringsInWraparoundString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findSubstringInWraproundString("a"), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findSubstringInWraproundString("cac"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findSubstringInWraproundString("zab"), 6)
    }
    
}

private class Solution {
    func findSubstringInWraproundString(_ s: String) -> Int {
        let s = Array(s)
        
        var characters = [Character: Int]()
        
        var currentLength = 0
        var result = 0
        
        for (index, character) in s.enumerated() {
            let current = characters[character, default: 0]
            
            if index > 0 && isNext(s[index - 1], character) == false {
                currentLength = 0
            }
            
            currentLength += 1
            
            if currentLength > current {
                result += currentLength - current
                characters[character] = currentLength
            }
        }
        
        return result
    }
    
    private func isNext(_ a: Character, _ b : Character) -> Bool {
        let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
        guard let indexA = alphabet.firstIndex(of: a),
              let indexB = alphabet.firstIndex(of: b) else { fatalError() }
        return (indexA + 1) % alphabet.count == indexB
    }
}
