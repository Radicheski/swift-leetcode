//
//  ShortestCommonSupersequence.swift
//  https://leetcode.com/problems/shortest-common-supersequence/
//
//  Created by Erik Radicheski da Silva on 28/02/25.
//

import XCTest

final class ShortestCommonSupersequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shortestCommonSupersequence("abac", "cab"), "cabac")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shortestCommonSupersequence("aaaaaaaa", "aaaaaaaa"), "aaaaaaaa")
    }
    
}

private class Solution {
    func shortestCommonSupersequence(_ str1: String, _ str2: String) -> String {
        let str1 = Array(str1)
        let str2 = Array(str2)
        
        var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
        
        for row in 0 ... str1.endIndex {
            dp[row][0] = row
        }
        
        for column in 0 ... str2.endIndex {
            dp[0][column] = column
        }
        
        for row in 1 ... str1.endIndex {
            for column in 1 ... str2.endIndex {
                if str1[row - 1] == str2[column - 1] {
                    dp[row][column] = dp[row - 1][column - 1] + 1
                } else {
                    dp[row][column] = min(dp[row - 1][column], dp[row][column - 1]) + 1
                }
            }
        }
        
        var superSequence = [Character]()
        var (row, column) = (str1.count, str2.count)
        
        while row > 0 && column > 0 {
            if str1[row - 1] == str2[column - 1] {
                superSequence.append(str1[row - 1])
                row -= 1
                column -= 1
            } else if dp[row - 1][column] < dp[row][column - 1] {
                superSequence.append(str1[row - 1])
                row -= 1
            } else {
                superSequence.append(str2[column - 1])
                column -= 1
            }
        }
        
        while row > 0 {
            superSequence.append(str1[row - 1])
            row -= 1
        }
        
        while column > 0 {
            superSequence.append(str2[column - 1])
            column -= 1
        }
        
        return String(superSequence.reversed())
    }
}
