//
//  MinimumNumberOfSwapsToMakeTheStringBalanced.swift
//  https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/
//
//  Created by Erik Radicheski da Silva on 08/10/24.
//

import XCTest

final class MinimumNumberOfSwapsToMakeTheStringBalanced: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSwaps("][]["), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSwaps("]]][[["), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minSwaps("[]"), 0)
    }
    
}

private class Solution {
    func minSwaps(_ s: String) -> Int {
        var s = Array(s)
        var swaps = 0
        var balance = 0
        var (left, right) = (0, s.endIndex - 1)
        
        while left < right {
            if s[left] == "[" {
                balance += 1
            } else if s[left] == "]" {
                balance -= 1
                
                if balance < 0 {
                    let temp = s[left]
                    s[left] = s[right]
                    s[right] = temp
                    
                    right -= 1
                    balance += 2
                    swaps += 1
                }
            }
            
            left += 1
        }
        
        return swaps
    }
}
