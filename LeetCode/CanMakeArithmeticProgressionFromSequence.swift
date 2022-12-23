//
//  CanMakeArithmeticProgressionFromSequence.swift
//  https://leetcode.com/problems/can-make-arithmetic-progression-from-sequence/
//
//  Created by Erik Radicheski da Silva on 23/12/22.
//

import XCTest

final class CanMakeArithmeticProgressionFromSequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canMakeArithmeticProgression([3, 5, 1]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canMakeArithmeticProgression([1, 2, 4]))
    }

}

private class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let array = arr.sorted()
        
        let diff = array[1] - array[0]
        
        for i in 2 ..< array.endIndex {
            if array[i] - array[i - 1] != diff { return false }
        }
        
        return true
    }
}
