//
//  StringCompression2.swift
//  https://leetcode.com/problems/string-compression-ii/
//
//  Created by Erik Radicheski da Silva on 28/12/23.
//

import XCTest

final class StringCompression2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getLengthOfOptimalCompression("aaabcccd", 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getLengthOfOptimalCompression("aabbaa", 2), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getLengthOfOptimalCompression("aaaaaaaaaaa", 0), 3)
    }
    
}

private class Solution {
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        let n = s.count
        
        var memo: [[Int]] = Array(repeating: Array(repeating: 1 << 30, count: k + 1), count: n + 1)
        memo[0][0] = 0
        
        for i in 1 ... n {
            for j in 0 ... k {
                if j > 0 {
                    memo[i][j] = memo[i - 1][j - 1]
                }
                var removed = 0
                var count = 0
                for p in stride(from: i, to: 0, by: -1) {
                    if s[p - 1] == s[i - 1] {
                        count += 1
                    } else {
                        removed += 1
                    }
                    
                    guard removed <= j else { break }
                    
                    memo[i][j] = min(memo[i][j], memo[p - 1][j - removed] + length(count))
                }
            }
        }
        
        return memo[n][k]
    }
    
    private func length(_ length: Int) -> Int {
        switch length {
        case 0: return 0
        case 1: return 1
        case ..<10: return 2
        case ..<100: return 3
        default: return 4
        }
    }
    
}
