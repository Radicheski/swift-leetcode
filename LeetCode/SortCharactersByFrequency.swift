//
//  SortCharactersByFrequency.swift
//  https://leetcode.com/problems/sort-characters-by-frequency/
//
//  Created by Erik Radicheski da Silva on 18/10/22.
//

import XCTest

final class SortCharactersByFrequency: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.frequencySort("tree")
        let expectedOutput = Set(["eetr", "eert"])
        XCTAssertTrue(expectedOutput.contains(output))
    }
    
    func testExampleB() {
        let output = solution.frequencySort("cccaaa")
        let expectedOutput = Set(["cccaaa", "aaaccc"])
        XCTAssertTrue(expectedOutput.contains(output))
    }
    
    func testExampleC() {
        let output = solution.frequencySort("Aabb")
        let expectedOutput = Set(["bbAa", "bbaA"])
        XCTAssertTrue(expectedOutput.contains(output))
    }
    
}

private class Solution {
    func frequencySort(_ s: String) -> String {
        Dictionary(Array(s).map { ($0, 1) }, uniquingKeysWith: +)
            .sorted { $0.value > $1.value }
            .map { String(repeating: $0.key, count: $0.value) }
            .reduce(into: StringBuilder(), +=)
            .build()
    }
    
    private struct StringBuilder {
        private var array = [String]()
        
        static func +=(lhs: inout StringBuilder, rhs: String) {
            lhs.array.append(rhs)
        }
        
        func build() -> String {
            array.joined()
        }
    }
}
