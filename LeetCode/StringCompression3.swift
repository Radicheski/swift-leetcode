//
//  StringCompression3.swift
//  https://leetcode.com/problems/string-compression-iii/
//
//  Created by Erik Radicheski da Silva on 04/11/24.
//

import XCTest

final class StringCompression3: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.compressedString("abcde"), "1a1b1c1d1e")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.compressedString("aaaaaaaaaaaaaabb"), "9a5a2b")
    }
    
}

private class Solution {
    func compressedString(_ word: String) -> String {
        var answer = [Character]()
        var count = 0
        var lastCharacter: Character = "\0"
        
        for c in word {
            if c == lastCharacter {
                count += 1
            } else {
                while count > 0 {
                    answer.append(contentsOf: "\(count > 9 ? 9 : count)" + [lastCharacter])
                    count -= 9
                }
                
                count = 1
                lastCharacter = c
            }
        }
        
        while count > 0 {
            answer.append(contentsOf: "\(count > 9 ? 9 : count)" + [lastCharacter])
            count -= 9
        }
        
        return String(answer)
    }
}
