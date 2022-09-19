//
//  PermutationInString.swift
//  https://leetcode.com/problems/permutation-in-string/
//
//  Created by Erik Radicheski da Silva on 19/09/22.
//

import XCTest

final class PermutationInString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkInclusion("ab", "eidbaooo"))
    }
                      
    func testExampleB() {
        XCTAssertFalse(solution.checkInclusion("ab", "eidboaoo"))
    }
    
}

private class Solution {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var substring = ""
        var windowSize = 0
        
        var s1CharacterCount = createEmptyCharacterCount()
        
        for character in s1 {
            s1CharacterCount[character]! += 1
        }
        
        var s2CharacterCount = createEmptyCharacterCount()
        
        for character in s2 {
            substring.append(character)
            windowSize += 1
            
            s2CharacterCount[character]! += 1
            
            if windowSize < s1.count { continue }
            while windowSize > s1.count {
                let removedCharacter = substring.removeFirst()
                s2CharacterCount[removedCharacter]! -= 1
                windowSize -= 1
            }
            
            if s1CharacterCount == s2CharacterCount { return true }
        }
        
        return false
    }
    
    private func createEmptyCharacterCount() -> [Character: Int] {
        let result = [Character: Int]()
        return (UInt8(ascii: "a") ... UInt8(ascii: "z"))
            .map { Character(Unicode.Scalar($0))}
            .reduce(into: result) { $0[$1] = 0 }
    }
    
}
