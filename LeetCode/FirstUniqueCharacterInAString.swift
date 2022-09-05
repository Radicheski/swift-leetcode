//
//  FirstUniqueCharacterInAString.swift
//  https://leetcode.com/problems/first-unique-character-in-a-string/
//
//  Created by Erik Radicheski da Silva on 05/09/22.
//

import XCTest

class FirstUniqueCharacterInAString: XCTestCase {

    func test() {
        let solution = Solution()
        
        XCTAssertEqual(solution.firstUniqChar("leetcode"), 0)
        XCTAssertEqual(solution.firstUniqChar("loveleetcode"), 2)
        XCTAssertEqual(solution.firstUniqChar("aabb"), -1)
    }

}

private class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var characterSet = Set<Character>()
        var uniqueChar = [(index: Int, character: Character)]()
        
        for (index, character) in s.enumerated() {
            if characterSet.contains(character) {
                uniqueChar.removeAll { $0.character == character }
            } else {
                characterSet.insert(character)
                uniqueChar.append((index, character))
            }
        }
        
        return uniqueChar.first?.index ?? -1
    }
}
