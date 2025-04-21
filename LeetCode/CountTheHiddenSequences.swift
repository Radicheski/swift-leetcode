//
//  CountTheHiddenSequences.swift
//  https://leetcode.com/problems/count-the-hidden-sequences/
//
//  Created by Erik Radicheski da Silva on 21/04/25.
//

import XCTest

final class CountTheHiddenSequences: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfArrays([1, -3, 4], 1, 6), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfArrays([3, -4, 5, 1, -2], -4, 5), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfArrays([4, -7, 2], 3, 6), 0)
    }
    
}

private class Solution {
    func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
        var sequence = (min: 0, max: 0)
        var sum = 0
        
        for difference in differences {
            sum += difference
            sequence.min = min(sequence.min, sum)
            sequence.max = max(sequence.max, sum)
        }
        
        let sequenceRange = sequence.max - sequence.min
        let givenRange = upper - lower
        
        guard givenRange >= sequenceRange else { return 0 }
        
        return givenRange - sequenceRange + 1
    }
}
