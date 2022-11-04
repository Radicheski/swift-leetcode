//
//  DeleteOperationForTwoStrings.swift
//  https://leetcode.com/problems/delete-operation-for-two-strings/
//
//  Created by Erik Radicheski da Silva on 04/11/22.
//

import XCTest

final class DeleteOperationForTwoStrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDistance("sea", "eat"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDistance("leetcode", "etco"), 4)
    }
    
}

private class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let text1 = Array(word1)
        let text2 = Array(word2)
        
        return text1.count + text2.count - 2 * lcs(text1, text2)
    }
    
    private func lcs(_ text1: [Character], _ text2: [Character]) -> Int {
        var array = (0 ... text1.endIndex).map { _ in (0 ... text2.endIndex).map { _ in 0 } }
        
        for i in 1 ... text1.endIndex {
            for j in 1 ... text2.endIndex {
                if text1[i - 1] == text2[j - 1] {
                    array[i][j] = 1 + array[i - 1][j - 1]
                } else {
                    array[i][j] = max(array[i - 1][j], array[i][j - 1])
                }
            }
        }
        
        return array.last?.last ?? 0
    }
}
