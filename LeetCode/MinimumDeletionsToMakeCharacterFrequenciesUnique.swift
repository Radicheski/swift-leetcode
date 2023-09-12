//
//  MinimumDeletionsToMakeCharacterFrequenciesUnique.swift
//  https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/
//
//  Created by Erik Radicheski da Silva on 12/09/23.
//

import XCTest

final class MinimumDeletionsToMakeCharacterFrequenciesUnique: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDeletions("aab"), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDeletions("aaabbbcc"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minDeletions("ceabaacb"), 2)
    }

}

private class Solution {
    func minDeletions(_ s: String) -> Int {
        var frequencies = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +).values
            .map { $0 }
        
        var deletionCount = 0
        
        while frequencies.isEmpty == false {
            frequencies.sort(by: >)
            
            let mostFrequent = frequencies.removeFirst()
            
            if frequencies.isEmpty { return deletionCount }
            
            if mostFrequent == frequencies.first {
                if mostFrequent > 1 {
                    frequencies.insert(mostFrequent - 1, at: 1)
                }
                
                deletionCount += 1
            }
        }
        
        return deletionCount
    }
    
}
