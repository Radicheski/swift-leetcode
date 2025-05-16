//
//  LongestUnequalAdjacentGroupsSubsequenceII.swift
//  https://leetcode.com/problems/longest-unequal-adjacent-groups-subsequence-ii/
//
//  Created by Erik Radicheski da Silva on 16/05/25.
//

import XCTest

final class LongestUnequalAdjacentGroupsSubsequenceII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getWordsInLongestSubsequence(["bab", "dab", "cab"], [1, 2, 2]), ["bab", "cab"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getWordsInLongestSubsequence(["a", "b", "c", "d"], [1, 2, 3, 4]), ["a", "b", "c", "d"])
    }
    
}

private class Solution {
    func getWordsInLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        var dp = Array(repeating: 1, count: words.count)
        var previous = Array(repeating: -1, count: words.count)
        var maxIndex = 0
        
        for i in 1 ..< words.endIndex {
            
            for j in 0 ..< i {
                guard words[i].count == words[j].count else { continue }
                if groups[i] == groups[j] { continue }
                guard dp[j] + 1 > dp[i] else { continue }
                guard hamming(words[i], words[j]) == 1 else { continue }
                
                dp[i] = dp[j] + 1
                previous[i] = j
            }
            
            if dp[i] > dp[maxIndex] {
                maxIndex = i
            }
        }
        
        var i = maxIndex
        var answer = [String]()
        while i >= 0 {
            answer.append(words[i])
            i = previous[i]
        }
        
        return answer.reversed()
    }
    
    private func hamming(_ s1: String, _ s2: String) -> Int {
        let s1 = Array(s1)
        let s2 = Array(s2)
        guard s1.count == s2.count else { return -1 }
        
        var distance = 0
        for i in 0 ..< s1.count {
            if s1[i] != s2[i] {
                distance += 1
            }
        }
        
        return distance
    }
}
