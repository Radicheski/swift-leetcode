//
//  EditDistance.swift
//  https://leetcode.com/problems/edit-distance/
//
//  Created by Erik Radicheski da Silva on 05/11/22.
//

import XCTest

final class EditDistance: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDistance("horse", "ros"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDistance("intention", "execution"), 5)
    }
    
}

private class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1.isEmpty == false && word2.isEmpty == false else {
            return max(word1.count, word2.count)
        }
        let word1 = Array(word1)
        let word2 = Array(word2)
        return minDistance(word1, word2)
    }
    
    private func minDistance(_ word1: [Character], _ word2: [Character]) -> Int {
        var process = (0 ... word1.count).map { _ in (0 ... word2.count).map { _ in 0 } }
        
        for i in 0 ... word1.endIndex {
            for j in 0 ... word2.endIndex {
                if i == 0 {
                    process[i][j] = j
                } else if j == 0 {
                    process[i][j] = i
                } else if word1[i - 1] == word2[j - 1] {
                    process[i][j] = process[i - 1][j - 1]
                } else {
                    process[i][j] = 1 + min(process[i][j - 1], process[i - 1][j], process[i - 1][j - 1])
                }
            }
        }
        
        return process.last?.last ?? -1
    }
}
