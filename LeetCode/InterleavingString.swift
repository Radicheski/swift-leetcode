//
//  InterleavingString.swift
//  https://leetcode.com/problems/interleaving-string/
//
//  Created by Erik Radicheski da Silva on 25/08/23.
//

import XCTest

final class InterleavingString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.isInterleave("aabcc", "dbbca", "aadbbcbcac"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isInterleave("aabcc", "dbbca", "aadbbbaccc"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.isInterleave("", "", ""))
    }
    
}

private class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let stringA = Array(s1)
        let stringB = Array(s2)
        let stringC = Array(s3)
        
        guard stringA.count + stringB.count == stringC.count else { return false }
        
        var dp: [[Bool?]] = Array(repeating: Array(repeating: nil, count: stringB.count + 1), count: stringA.count + 1)
        dp[stringA.endIndex][stringB.endIndex] = true
        
        return isInterleave(stringA, 0, stringB, 0, stringC, &dp)
    }
    
    func isInterleave(_ stringA: [Character], _ startA: Int,
                      _ stringB: [Character], _ startB: Int,
                      _ stringC: [Character], _ dp: inout [[Bool?]]) -> Bool {
        guard stringA.indices.contains(startA) else {
            let answer = stringB[startB...] == stringC[(startA + startB)...]
            dp[startA][startB] = answer
            return answer
        }
        
        guard stringB.indices.contains(startB) else {
            let answer = stringA[startA...] == stringC[(startA + startB)...]
            dp[startA][startB] = answer
            return answer
        }
        
        if let answer = dp[startA][startB] {
            return answer
        }
        
        let startC = startA + startB
        var answer = false
        
        if stringA[startA] == stringC[startC] {
            answer = answer || isInterleave(stringA, startA + 1, stringB, startB, stringC, &dp)
        }
        
        if stringB[startB] == stringC[startC] {
            answer = answer || isInterleave(stringA, startA, stringB, startB + 1, stringC, &dp)
        }
        
        dp[startA][startB] = answer
        return answer
    }
}

