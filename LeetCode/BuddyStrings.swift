//
//  BuddyStrings.swift
//  https://leetcode.com/problems/buddy-strings/
//
//  Created by Erik Radicheski da Silva on 03/07/23.
//

import XCTest

final class BuddyStrings: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.buddyStrings("ab", "ba"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.buddyStrings("ab", "ab"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.buddyStrings("aa", "aa"))
    }

}

private class Solution {
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        let s = Array(s)
        let goal = Array(goal)
        
        guard s.count == goal.count else { return false }
        
        if s == goal {
            let frequency = Dictionary(s.map( { ($0, 1) } ), uniquingKeysWith: +)
            return frequency.contains { $0.value >= 2 }
        }
        
        var first: Int?
        var second: Int?
        
        for i in s.indices {
            guard s[i] != goal[i] else { continue }
            
            if first == nil {
                first = i
            } else if second == nil {
                second = i
            } else {
                return false
            }
        }
        
        guard let first = first, let second = second else  { return false }
        
        return s[first] == goal[second] && s[second] == goal[first]
    }
}
