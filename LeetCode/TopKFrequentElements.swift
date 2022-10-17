//
//  TopKFrequentElements.swift
//  https://leetcode.com/problems/top-k-frequent-elements/
//
//  Created by Erik Radicheski da Silva on 17/10/22.
//

import XCTest

final class TopKFrequentElements: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let output = Set(solution.topKFrequent([1, 1, 1, 2, 2, 3], 2))
        let expectedOutput = Set([1, 2])
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleB() {
        let output = Set(solution.topKFrequent([1], 1))
        let expectedOutput = Set([1])
        XCTAssertEqual(output, expectedOutput)
    }

}

private class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
            .sorted { $0.value > $1.value }
            .enumerated()
            .filter { $0.offset < k }
            .map { $0.element.key }
    }
}
