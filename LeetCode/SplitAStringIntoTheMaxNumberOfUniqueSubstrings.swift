//
//  SplitAStringIntoTheMaxNumberOfUniqueSubstrings.swift
//  https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings/
//
//  Created by Erik Radicheski da Silva on 21/10/24.
//

import XCTest

final class SplitAStringIntoTheMaxNumberOfUniqueSubstrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxUniqueSplit("ababccc"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxUniqueSplit("aba"), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxUniqueSplit("aa"), 1)
    }
    
}

private class Solution {
    func maxUniqueSplit(_ s: String) -> Int {
        var seen = Set<[Character]>()
        var s = Array(s)
        return maxUniqueSplit(s, &seen, 0)
    }
    
    private func maxUniqueSplit(_ s: [Character], _ seen: inout Set<[Character]>, _ start: Int) -> Int {
        guard s.indices.contains(start) else { return 0 }
        
        var maxCount = 0
        
        for end in start + 1 ... s.endIndex {
            let substring = Array(s[start ..< end])
            
            if seen.contains(substring) == false {
                seen.insert(substring)
                
                maxCount = max(maxCount, maxUniqueSplit(s, &seen, end) + 1)
                
                seen.remove(substring)
            }
        }
        
        return maxCount
    }
}
