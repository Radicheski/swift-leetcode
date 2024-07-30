//
//  MinimumDeletionsToMakeStringBalanced.swift
//  https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/
//
//  Created by Erik Radicheski da Silva on 30/07/24.
//

import XCTest

final class MinimumDeletionsToMakeStringBalanced: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumDeletions("aababbab"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumDeletions("bbaaaaabb"), 2)
    }
    
}

private class Solution {
    func minimumDeletions(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        
        var a = Array(repeating: 0, count: s.count)
        var aCount = 0
        var b = Array(repeating: 0, count: s.count)
        var bCount = 0
        
        for i in 0 ..< n {
            b[i] = bCount
            if s[i] == "b" {
                bCount += 1
            }
            
            a[n - i - 1] = aCount
            if s[n - i - 1] == "a" {
                aCount += 1
            }
        }
        
        var minimum = Int.max
        
        for i in a.indices {
            minimum = min(minimum, a[i] + b[i])
        }
        
        return minimum
    }
}
