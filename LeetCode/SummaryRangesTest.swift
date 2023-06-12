//
//  SummaryRanges.swift
//  https://leetcode.com/problems/summary-ranges/
//
//  Created by Erik Radicheski da Silva on 12/06/23.
//

import XCTest

final class SummaryRangesTest: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.summaryRanges([0, 1, 2, 4, 5, 7]), ["0->2", "4->5", "7"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.summaryRanges([0, 2, 3, 4, 6, 8, 9]), ["0", "2->4", "6", "8->9"])
    }

}

private class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var answer = [(start: Int, end: Int)]()
        
        var range: (start: Int, end: Int)?
        
        for num in nums {
            if let r = range {
                if num == r.end + 1 {
                    range?.end = num
                } else {
                    answer.append(r)
                    range = (num, num)
                }
            } else {
                range = (num, num)
            }
        }
        
        if let r = range {
            answer.append(r)
        }
        
        return answer.map { $0.start == $0.end ? "\($0.start)" : "\($0.start)->\($0.end)" }
    }
}
