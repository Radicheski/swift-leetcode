//
//  BulbSwitcher.swift
//  https://leetcode.com/problems/bulb-switcher/
//
//  Created by Erik Radicheski da Silva on 27/04/23.
//

import XCTest

final class BulbSwitcher: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.bulbSwitch(3), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.bulbSwitch(0), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.bulbSwitch(1), 1)
    }

}

private class Solution {
    func bulbSwitch(_ n: Int) -> Int {
        return Int(sqrt(Double(n)))
    }
}
