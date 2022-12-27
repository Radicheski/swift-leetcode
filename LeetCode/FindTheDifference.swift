//
//  FindTheDifference.swift
//  https://leetcode.com/problems/find-the-difference/
//
//  Created by Erik Radicheski da Silva on 27/12/22.
//

import XCTest

final class FindTheDifference: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findTheDifference("abcd", "abcde"), "e")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findTheDifference("", "y"), "y")
    }

}

private class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let s = Array(s).sorted()
        let t = Array(t).sorted()
        
        for i in 0 ..< s.endIndex {
            if s[i] != t[i] {
                return t[i]
            }
        }
        
        return t.last!
    }
}
