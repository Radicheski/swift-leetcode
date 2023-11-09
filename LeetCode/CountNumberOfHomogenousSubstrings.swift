//
//  CountNumberOfHomogenousSubstrings.swift
//  https://leetcode.com/problems/count-number-of-homogenous-substrings/
//
//  Created by Erik Radicheski da Silva on 09/11/23.
//

import XCTest

final class CountNumberOfHomogenousSubstrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countHomogenous("abbcccaa"), 13)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countHomogenous("xy"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countHomogenous("zzzzz"), 15)
    }

}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func countHomogenous(_ s: String) -> Int {
        let s = Array(s)
        var lastCharacter = s[0]
        var count = 0
        
        var answer = 0
        
        for character in s {
            if character == lastCharacter {
                count += 1
            } else {
                lastCharacter = character
                count = 1
            }
            
            answer += count
            answer %= mod
        }
        
        
        return answer
    }
}
