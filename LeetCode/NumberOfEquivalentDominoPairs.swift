//
//  NumberOfEquivalentDominoPairs.swift
//  https://leetcode.com/problems/number-of-equivalent-domino-pairs/
//
//  Created by Erik Radicheski da Silva on 04/05/25.
//

import XCTest

final class NumberOfEquivalentDominoPairs: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numEquivDominoPairs([[1, 2], [2, 1], [3, 4], [5, 6]]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numEquivDominoPairs([[1, 2], [1, 2], [1, 1], [1, 2], [2, 2]]), 3)
    }
    
}

private class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var count = [Int: Int]()
        var answer = 0
        
        for domino in dominoes {
            let domino = domino.sorted()
            let key = domino[0] * 10 + domino[1]
            answer += count[key, default: 0]
            count[key, default: 0] += 1
        }
        
        return answer
    }
}
