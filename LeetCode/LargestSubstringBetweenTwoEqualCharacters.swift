//
//  LargestSubstringBetweenTwoEqualCharacters.swift
//  https://leetcode.com/problems/largest-substring-between-two-equal-characters/
//
//  Created by Erik Radicheski da Silva on 31/12/23.
//

import XCTest

final class LargestSubstringBetweenTwoEqualCharacters: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxLengthBetweenEqualCharacters("aa"), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxLengthBetweenEqualCharacters("abca"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxLengthBetweenEqualCharacters("cbzxy"), -1)
    }

}

private class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var indices = [Character: [Int]]()
        
        for (i, character) in s.enumerated() {
            indices[character, default: []].append(i)
        }
        
        var answer = -1
        
        for array in indices.values where array.count > 1 {
            let array = array.sorted()
            
            answer = max(answer, array.last! - array.first! - 1)
        }
        
        return answer
    }
}
