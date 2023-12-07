//
//  LargestOddNumberInString.swift
//  https://leetcode.com/problems/largest-odd-number-in-string/
//
//  Created by Erik Radicheski da Silva on 07/12/23.
//

import XCTest

final class LargestOddNumberInString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestOddNumber("52"), "5")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestOddNumber("4206"), "")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.largestOddNumber("35427"), "35427")
    }

}

private class Solution {
    func largestOddNumber(_ num: String) -> String {
        guard let index = num.lastIndex(where: { "13579".contains($0) } ) else { return "" }
        return String(num[...index])
    }
}
