//
//  ConstructStringWithRepeatLimit.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 17/12/24.
//

import XCTest

final class ConstructStringWithRepeatLimit: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.repeatLimitedString("cczazcc", 3), "zzcccac")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.repeatLimitedString("aababab", 2), "bbabaa")
    }
    
}

private class Solution {
    
    private let characters = Array("abcdefghijklmnopqrstuvwxyz")
    
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var freq = [Int](repeating: 0, count: 26)
        
        for ch in s {
            let index = Int(ch.asciiValue! - Character("a").asciiValue!)
            freq[index] += 1
        }
        
        var result = [Character]()
        var currentCharIndex = 25
        
        while currentCharIndex >= 0 {
            if freq[currentCharIndex] == 0 {
                currentCharIndex -= 1
                continue
            }
            
            let use = min(freq[currentCharIndex], repeatLimit)
            
            result.append(contentsOf: Array(repeating: characters[currentCharIndex], count: use))
            
            freq[currentCharIndex] -= use
            
            if freq[currentCharIndex] > 0 {
                var smallerCharIndex = currentCharIndex - 1
                while smallerCharIndex >= 0 && freq[smallerCharIndex] == 0 {
                    smallerCharIndex -= 1
                }
                
                if smallerCharIndex < 0 {
                    break
                }
                
                result.append(characters[smallerCharIndex])
                freq[smallerCharIndex] -= 1
            }
        }
        
        return String(result)
    }
}
