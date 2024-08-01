//
//  NumberOfSeniorCitizens.swift
//  https://leetcode.com/problems/number-of-senior-citizens/
//
//  Created by Erik Radicheski da Silva on 01/08/24.
//

import XCTest

final class NumberOfSeniorCitizens: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countSeniors(["7868190130M7522", "5303914400F9211", "9273338290F4010"]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countSeniors(["1313579440F2036", "2921522980M5644"]), 0)
    }
    
}

private class Solution {
    func countSeniors(_ details: [String]) -> Int {
        return details.map(getAge).filter { $0 > 60 }.count
    }
    
    private func getAge(_ detail: String) -> Int {
        var age = 0
        
        for (i, c) in detail.enumerated() {
            guard i >= 11 else { continue }
            guard i <= 12 else { break }

            age += c.hexDigitValue! * (i == 11 ? 10 : 1)
        }
        
        return age
    }
}
