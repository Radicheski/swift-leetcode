//
//  MinimumNumberOfOperationsToMoveAllBallsToEachBox.swift
//  https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box/
//
//  Created by Erik Radicheski da Silva on 06/01/25.
//

import XCTest

final class MinimumNumberOfOperationsToMoveAllBallsToEachBox: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations("110"), [1, 1, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations("001011"), [11, 8, 5, 4, 3, 4])
    }
    
}

private class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        var answer = Array(repeating: 0, count: boxes.count)
        let boxes = boxes.enumerated().filter { $0.element == "1" }.map(\.offset)
        
        for i in answer.indices {
            for box in boxes {
                answer[i] += abs(box - i)
            }
        }
        
        return answer
    }
}
