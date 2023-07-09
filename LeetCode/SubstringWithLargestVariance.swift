//
//  SubstringWithLargestVariance.swift
//  https://leetcode.com/problems/substring-with-largest-variance/
//
//  Created by Erik Radicheski da Silva on 09/07/23.
//

import XCTest

final class SubstringWithLargestVariance: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestVariance("aababbb"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestVariance("abcde"), 0)
    }
    
}

private class Solution {
    let alphabet = Array("abcdefghijklmnnopqrsstuvwxyz")
    
    func largestVariance(_ s: String) -> Int {
        let s = Array(s)
        
        var counter = [Character: Int]()
        for ch in s {
            counter[ch, default: 0] += 1
        }
        
        var globalMax = 0
        
        for major in alphabet {
            for minor in alphabet {
                if (major == minor || counter[major] == 0 || counter[minor] == 0) {
                    continue;
                }
                
                var majorCount = 0
                var minorCount = 0
                
                var restMinor = counter[minor, default: 0]
                
                for ch in s {
                    if(ch == major) {
                        majorCount += 1
                    }
                    if(ch == minor) {
                        minorCount += 1
                        restMinor -= 1
                    }
                    
                    if (minorCount > 0) {
                        globalMax = max(globalMax, majorCount - minorCount)
                    }
                    
                    if (majorCount < minorCount && restMinor > 0) {
                        majorCount = 0
                        minorCount = 0
                    }
                }
            }
        }
        
        return globalMax
    }
}
