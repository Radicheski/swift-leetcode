//
//  FindScoreOfAnArrayAfterMarkingAllElements.swift
//  https://leetcode.com/problems/find-score-of-an-array-after-marking-all-elements/
//
//  Created by Erik Radicheski da Silva on 13/12/24.
//

import XCTest

final class FindScoreOfAnArrayAfterMarkingAllElements: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findScore([2, 1, 3, 4, 5, 2]), 7)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findScore([2, 3, 5, 1, 3, 2]), 5)
    }
    
}

private class Solution {
    func findScore(_ nums: [Int]) -> Int {
        let sorted = nums.enumerated().sorted { $0.element == $1.element ? $0.offset < $1.offset : $0.element < $1.element }
        var marked = Array(repeating: false, count: nums.count)
        
        var score = 0
        
        for (i, num) in sorted {
            if marked[i] { continue }
            marked[i] = true
            
            score += num
            
            if marked.indices.contains(i - 1) { marked[i - 1] = true }
            if marked.indices.contains(i + 1) { marked[i + 1] = true }
        }
        
        return score
    }
}
