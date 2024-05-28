//
//  GetEqualSubstringWithinBudget.swift
//  https://leetcode.com/problems/get-equal-substrings-within-budget/
//
//  Created by Erik Radicheski da Silva on 28/05/24.
//

import XCTest

final class GetEqualSubstringWithinBudget: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.equalSubstring("abcd", "bcdf", 3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.equalSubstring("abcd", "cdef", 3), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.equalSubstring("abcd", "acde", 0), 1)
    }
    
}

private class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let s = s.compactMap(\.asciiValue).map(Int.init)
        let t = t.compactMap(\.asciiValue).map(Int.init)
        
        var distance = Array(repeating: 0, count: s.count)
        
        for i in distance.indices {
            distance[i] = abs(s[i] - t[i])
        }
        
        var start = 0
        var end = 0
        
        var length = 0
        var cost = 0

        while end < distance.endIndex {
            cost += distance[end]
            end += 1
            
            while cost > maxCost {
                cost -= distance[start]
                start += 1
            }
            
            length = max(length, end - start)
        }
        
        return length
    }
}
