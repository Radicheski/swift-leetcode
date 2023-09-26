//
//  RemoveDuplicateLetters.swift
//  https://leetcode.com/problems/remove-duplicate-letters/?envType=daily-question&envId=2023-09-26
//
//  Created by Erik Radicheski da Silva on 25/09/23.
//

import XCTest

final class RemoveDuplicateLetters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeDuplicateLetters("bcabc"), "abc")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeDuplicateLetters("cbacdcbc"), "acdb")
    }

}

private class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]()
        var seen = Set<Character>()
        let last = Dictionary(s.enumerated().map { ($0.element, $0.offset) }, uniquingKeysWith: max)
        
        
        for (i, character) in s.enumerated() where seen.contains(character) == false {
            while let top = stack.last, character < top, last[top]! > i {
                let _ = stack.removeLast()
                seen.remove(top)
            }
            
            stack.append(character)
            seen.insert(character)
        }
        
        return String(stack)
    }
}
