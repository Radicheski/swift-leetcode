//
//  FindSmallestLetterGreaterThanTarget.swift
//  https://leetcode.com/problems/find-smallest-letter-greater-than-target/
//
//  Created by Erik Radicheski da Silva on 09/06/23.
//

import XCTest

final class FindSmallestLetterGreaterThanTarget: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nextGreatestLetter(["c", "f", "j"], "a"), "c")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nextGreatestLetter(["c", "f", "j"], "c"), "f")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.nextGreatestLetter(["x", "x", "y", "y"], "z"), "x")
    }

}

private class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        guard letters.last! > target else { return letters.first! }
        
        var left = 0
        var right = letters.endIndex - 1
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if letters[middle] <= target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return letters[left]
    }
}
