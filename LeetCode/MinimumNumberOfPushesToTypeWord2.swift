//
//  MinimumNumberOfPushesToTypeWord2.swift
//  https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii/
//
//  Created by Erik Radicheski da Silva on 06/08/24.
//

import XCTest

final class MinimumNumberOfPushesToTypeWord2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumPushes("abcde"), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumPushes("xyzxyzxyzxyz"), 12)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumPushes("aabbccddeeffgghhiiiiii"), 24)
    }
    
}

private class Solution {
    func minimumPushes(_ word: String) -> Int {
        var count = [Character: Int]()
        
        for character in word {
            count[character, default: 0] += 1
        }
    
        return count.values.sorted(by: >).enumerated().reduce(into: 0) { sum, par in
            sum += par.element * ((par.offset / 8) + 1)
        }
    }
}
