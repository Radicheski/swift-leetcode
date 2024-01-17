//
//  UniqueNumberOfOccurrences.swift
//  https://leetcode.com/problems/unique-number-of-occurrences/
//
//  Created by Erik Radicheski da Silva on 17/01/24.
//

import XCTest

final class UniqueNumberOfOccurrences: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.uniqueOccurrences([1, 2, 2, 1, 1, 3]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.uniqueOccurrences([1, 2]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.uniqueOccurrences([-3, 0, 1, -3, 1, 1, 1, -3, 10, 0]))
    }
    
}

private class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        let occurrences = Dictionary(arr.map { ($0, 1) }, uniquingKeysWith: +)
        return Set(occurrences.values).count == occurrences.count
    }
}
