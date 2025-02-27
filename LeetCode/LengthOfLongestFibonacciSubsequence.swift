//
//  LengthOfLongestFibonacciSubsequence.swift
//  https://leetcode.com/problems/length-of-longest-fibonacci-subsequence/
//
//  Created by Erik Radicheski da Silva on 27/02/25.
//

import XCTest

final class LengthOfLongestFibonacciSubsequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lenLongestFibSubseq([1, 2, 3, 4, 5, 6, 7, 8]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lenLongestFibSubseq([1, 3, 7, 11, 12, 14, 18]), 3)
    }
    
}

private class Solution {
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: arr.count), count: arr.count)
        var indices = Dictionary(uniqueKeysWithValues: arr.enumerated().map { ($0.element, $0.offset) } )
        var maxLength = Int.min
        
        for current in 1 ..< arr.endIndex {
            for previous in 0 ..< current {
                let difference = arr[current] - arr[previous]
                
                if let index = indices[difference], difference < arr[previous] {
                    dp[previous][current] = dp[index][previous] + 1
                } else {
                    dp[previous][current] = 2
                }
                
                maxLength = max(maxLength, dp[previous][current])
            }
        }
        
        return maxLength > 2 ? maxLength : 0
    }
}
