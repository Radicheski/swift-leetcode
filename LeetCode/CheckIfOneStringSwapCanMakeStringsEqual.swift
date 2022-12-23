//
//  CheckIfOneStringSwapCanMakeStringsEqual.swift
//  https://leetcode.com/problems/check-if-one-string-swap-can-make-strings-equal/
//
//  Created by Erik Radicheski da Silva on 23/12/22.
//

import XCTest

final class CheckIfOneStringSwapCanMakeStringsEqual: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.areAlmostEqual("bank", "kanb"))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.areAlmostEqual("attack", "defend"))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.areAlmostEqual("kelb", "kelb"))
    }

}

private class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        guard s1 != s2 else { return true }
        
        var s1 = Array(s1)
        var s2 = Array(s2)
        
        guard s1.count == s2.count else { return false }
        
        let dict1 = Dictionary(s1.map { ($0, 1) }, uniquingKeysWith: +)
        let dict2 = Dictionary(s2.map { ($0, 1) }, uniquingKeysWith: +)
        
        guard dict1 == dict2 else { return false }
        
        for i in (0 ..< s1.endIndex).reversed() {
            if s1[i] == s2[i] {
                let _ = s1.remove(at: i)
                let _ = s2.remove(at: i)
            }
        }
        
        return s1.count == 2 || s2.count == 2
    }
}
