//
//  TotalCharactersInStringAfterTransformationsI.swift
//  https://leetcode.com/problems/total-characters-in-string-after-transformations-i/
//
//  Created by Erik Radicheski da Silva on 13/05/25.
//

import XCTest

final class TotalCharactersInStringAfterTransformationsI: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lengthAfterTransformations("abcyy", 2), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lengthAfterTransformations("azbk", 1), 5)
    }
    
}

private class Solution {
    private let mod = 1_000_000_007
    
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        let indices = Dictionary(uniqueKeysWithValues: "abcdefghijklmnopqrstuvwxyz".enumerated().map( { ($0.element, $0.offset) } ))
        var count = Array(repeating: 0, count: 26)
        for c in s {
            count[indices[c]!] += 1
        }
        
        for _ in 0 ..< t {
            var nextCount = Array(repeating: 0, count: 26)
            nextCount[0] = count[25]
            nextCount[1] = count[25]
            
            for i in 1 ..< count.endIndex {
                nextCount[i] += count[i - 1]
                nextCount[i] %= mod
            }
            
            count = nextCount
        }
        
        return count.reduce(into: 0) { (sum, freq) in
            sum += freq
            sum %= mod
        }
    }
}
