//
//  MinimumLengthOfStringAfterDeletingSimilarEnds.swift
//  https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends/
//
//  Created by Erik Radicheski da Silva on 05/03/24.
//

import XCTest

final class MinimumLengthOfStringAfterDeletingSimilarEnds: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumLength("ca"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumLength("cabaabac"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumLength("aabccabba"), 3)
    }
    
}

private class Solution {
    func minimumLength(_ s: String) -> Int {
        let s = Array(s)
        
        var left = 0
        var right = s.endIndex - 1
        
        while left < right {
            guard s[left] == s[right] else { break }
            
            let character = s[left]
            
            while left <= right && s[left] == character {
                left += 1
            }
            
            while left < right && s[right] == character {
                right -= 1
            }
        }
        
        return right - left + 1
    }
}
