//
//  NumberOfWonderfulSubstrings.swift
//  https://leetcode.com/problems/number-of-wonderful-substrings/
//
//  Created by Erik Radicheski da Silva on 30/04/24.
//

import XCTest

final class NumberOfWonderfulSubstrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.wonderfulSubstrings("aba"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.wonderfulSubstrings("aabb"), 9)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.wonderfulSubstrings("he"), 2)
    }
    
}

private class Solution {
    func wonderfulSubstrings(_ word: String) -> Int {
        let word = word.compactMap(\.asciiValue).map(Int.init).map { 1 << ($0 - 97) }
        var frequency = [0: 1]
        var mask = 0
        var answer = 0
        
        for letter in word {
            mask ^= letter
            
            answer += frequency[mask, default: 0]
            frequency[mask, default: 0] += 1
            
            for bit in 0 ..< 10 {
                answer += frequency[mask ^ (1 << bit), default: 0]
            }
        }
        
        return answer
    }
}
