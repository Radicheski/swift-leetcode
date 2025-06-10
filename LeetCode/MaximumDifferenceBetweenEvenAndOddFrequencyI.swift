//
//  MaximumDifferenceBetweenEvenAndOddFrequencyI.swift
//  https://leetcode.com/problems/maximum-difference-between-even-and-odd-frequency-i/
//
//  Created by Erik Radicheski da Silva on 10/06/25.
//

import XCTest

final class MaximumDifferenceBetweenEvenAndOddFrequencyI: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxDifference("aaaaabbc"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxDifference("abcabcab"), 1)
    }
    
}

private class Solution {
    func maxDifference(_ s: String) -> Int {
        let count = Dictionary(s.map { ($0, 1) }, uniquingKeysWith: +)
        let oddCount = count.values.filter( { $0.isMultiple(of: 2) == false } ).max()!
        let evenCount = count.values.filter( { $0.isMultiple(of: 2) } ).min()!
        return oddCount - evenCount
    }
}
