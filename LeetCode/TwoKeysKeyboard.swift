//
//  TwoKeysKeyboard.swift
//  https://leetcode.com/problems/2-keys-keyboard/
//
//  Created by Erik Radicheski da Silva on 19/08/24.
//

import XCTest

final class TwoKeysKeyboard: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minSteps(3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minSteps(1), 0)
    }
    
}

private class Solution {
    func minSteps(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        return 1 + operation(1, 1, n)
    }
    
    private func operation(_ i: Int, _ j: Int, _ n: Int) -> Int {
        guard i <= n else { return 1 << 20 }
        guard i < n else { return 0 }
        return min(2 + operation(2 * i, i, n), 1 + operation(i + j, j, n))
    }
}
