//
//  SolvingQuestionsWithBrainpower.swift
//  https://leetcode.com/problems/solving-questions-with-brainpower/
//
//  Created by Erik Radicheski da Silva on 12/05/23.
//

import XCTest

final class SolvingQuestionsWithBrainpower: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mostPoints([[3, 2], [4, 3], [4, 4], [2, 5]]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mostPoints([[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]), 7)
    }

}

private class Solution {
    func mostPoints(_ questions: [[Int]]) -> Int {
        var points = Array(repeating: 0, count: questions.count)
        
        for (i, question) in questions.enumerated().reversed() {
            if questions.indices.contains(i + question[1] + 1) {
                points[i] = max(question[0] + points[i + question[1] + 1], points[i + 1])
            } else if questions.indices.contains(i + 1) {
                points[i] = max(question[0], points[i + 1])
            } else {
                points[i] = question[0]
            }
        }
        
        return points[0]
    }
}
