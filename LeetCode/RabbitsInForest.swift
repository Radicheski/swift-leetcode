//
//  RabbitsInForest.swift
//  https://leetcode.com/problems/rabbits-in-forest/
//
//  Created by Erik Radicheski da Silva on 20/04/25.
//

import XCTest

final class RabbitsInForest: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numRabbits([1, 1, 2]), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numRabbits([10, 10, 10]), 11)
    }
    
}

private class Solution {
    func numRabbits(_ answers: [Int]) -> Int {
        let count = Dictionary(answers.map { ($0, 1) }, uniquingKeysWith: +)
        var result = 0
        
        for (answer, frequency) in count {
            let groups = (frequency / (answer + 1)) + (frequency.isMultiple(of: answer + 1) ? 0 : 1)
            result += groups * (answer + 1)
        }
        
        return result
    }
}
