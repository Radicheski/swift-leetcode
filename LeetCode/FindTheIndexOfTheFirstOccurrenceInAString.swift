//
//  FindTheIndexOfTheFirstOccurrenceInAString.swift
//  https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/
//
//  Created by Erik Radicheski da Silva on 01/01/23.
//

import XCTest

final class FindTheIndexOfTheFirstOccurrenceInAString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.strStr("sadbutsad", "sad"), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.strStr("leetcode", "leeto"), -1)
    }
    
}

private class Solution {
    
    private let notFound = -1
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystack = Array(haystack)
        let needle = Array(needle)
        
        var candidates = haystack.enumerated()
            .compactMap { $0.element == needle[0] ? $0.offset : nil }
            .filter { $0 <= haystack.count - needle.count }
        
        guard candidates.isEmpty == false else { return notFound }
        
    outerLoop: for index in candidates {
            for offset in 1 ..< needle.count {
                if haystack[index + offset] != needle[offset] {
                    continue outerLoop
                }
            }
            return index
        }
        
        return notFound
    }
}
