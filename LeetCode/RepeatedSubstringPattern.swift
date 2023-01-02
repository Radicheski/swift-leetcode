//
//  RepeatedSubstringPattern.swift
//  https://leetcode.com/problems/repeated-substring-pattern/
//
//  Created by Erik Radicheski da Silva on 02/01/23.
//

import XCTest

final class RepeatedSubstringPattern: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.repeatedSubstringPattern("abab"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.repeatedSubstringPattern("aba"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.repeatedSubstringPattern("abcabcabcabc"))
    }
   
}

private class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let s = Array(s)
        
    outerLoop: for i in 0 ... s.count / 2 {
            guard s.count.isMultiple(of: i + 1) else { continue }
            
            let substring = Array(s[...i])
            let times = s.count / substring.count
        
        guard times > 1 else { continue }
            
            for j in 1 ..< times {
                for k in 0 ..< substring.endIndex {
                    if substring[k] != s[j * substring.count + k] {
                        continue outerLoop
                    }
                }
            }
            
            return true
        }
                
        return false
    }
}
