//
//  IsomorphicStrings.swift
//  https://leetcode.com/problems/isomorphic-strings/
//
//  Created by Erik Radicheski da Silva on 17/08/22.
//

import XCTest

class IsomorphicStrings: XCTestCase {
    
    private let solution = Solution()

    func testExampleA() {
        XCTAssertTrue(solution.isIsomorphic("egg", "add"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.isIsomorphic("foo", "bar"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.isIsomorphic("paper", "title"))
    }

}

private class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let first = getCharacterPositions(s)
        let second = getCharacterPositions(t)

        return compare(first, to: second)
    }

    private func getCharacterPositions(_ string: String) -> [Character: [Int]] {
        return string.enumerated().reduce(into: [Character: [Int]]()) { result, pair in
            result[pair.element, default: []].append(pair.offset)
        }
    }

    private func compare(_ first: [Character: [Int]], to second: [Character: [Int]]) -> Bool {
        var second = second

        for tuple in first {
            if let index = second.firstIndex(where: { $0.value == tuple.value } ) {
                second.remove(at: index)
            } else {
                return false
            }
        }

        return true
    }

}
