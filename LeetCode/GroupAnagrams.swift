//
//  GroupAnagrams.swift
//  https://leetcode.com/problems/group-anagrams/
//
//  Created by Erik Radicheski da Silva on 05/10/22.
//

import XCTest

final class GroupAnagrams: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = ["eat","tea","tan","ate","nat","bat"]
        let output = arrayToSet(solution.groupAnagrams(input))
        let expectedOutput = arrayToSet([["bat"],["nat","tan"],["ate","eat","tea"]])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = [""]
        let output = arrayToSet(solution.groupAnagrams(input))
        let expectedOutput = arrayToSet([[""]])
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleC() {
        let input = ["a"]
        let output = arrayToSet(solution.groupAnagrams(input))
        let expectedOutput = arrayToSet([["a"]])
        XCTAssertEqual(expectedOutput, output)
    }
    
    private func arrayToSet(_ array: [[String]]) -> Set<Set<String>> {
        array
            .map { Set($0) }
            .reduce(into: Set()) { $0.insert($1) }
    }

}

private class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        strs.reduce(into: [[Character]: [String]]()) { result, string in
            let key = string.sorted()
            result[key, default: []].append(string)
        }
        .values
        .reduce(into: []) { result, array in
            result.append(array)
        }
    }
    
}
