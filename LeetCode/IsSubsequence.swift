//
//  IsSubsequence.swift
//  https://leetcode.com/problems/is-subsequence/
//
//  Created by Erik Radicheski da Silva on 17/08/22.
//

import XCTest

class IsSubsequence: XCTestCase {

    func test() {
        let solution = Solution()

        XCTAssertTrue(solution.isSubsequence("abc", "ahbgdc"))
        XCTAssertFalse(solution.isSubsequence("axc", "ahbgdc"))
    }

}

private class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }
        var t = t

        for char in s {
            if let index = t.firstIndex(of: char) {
                t.removeSubrange(t.startIndex...index)
            } else {
                return false
            }
        }

        return true
    }
}
