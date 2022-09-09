//
//  LongestRepeatingCharacterReplacement.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 27/08/22.
//

import XCTest

class LongestRepeatingCharacterReplacement: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.characterReplacement("ABAB", 2), 4)
        XCTAssertEqual(solution.characterReplacement("AABABBA", 1), 4)
    }

}

private class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var chars = [Character: Int]()
        
        var maxCount = 0
        var maxLength = 0
        
        var window = [Character]()
        
        for char in s {
            chars[char, default: 0] += 1
            window.append(char)
            maxCount = max(maxCount, chars[char]!)
            while(window.count - maxCount > k) {
                let removeChar = window.removeFirst()
                if let count = chars[removeChar] {
                    chars[removeChar] = count - 1
                }
            }
            maxLength = max(maxLength, window.count)
        }
        
        return maxLength
    }
}