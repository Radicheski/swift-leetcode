//
//  MaximizeHappinessOfSelectedChildren.swift
//  https://leetcode.com/problems/maximize-happiness-of-selected-children/
//
//  Created by Erik Radicheski da Silva on 09/05/24.
//

import XCTest

final class MaximizeHappinessOfSelectedChildren: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumHappinessSum([1, 2, 3], 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumHappinessSum([1, 1, 1, 1], 2), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumHappinessSum([2, 3, 4, 5], 1), 5)
    }
    
}

private class Solution {
    func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
        let happiness = happiness.sorted(by: >)
        var answer = 0
        
        for i in 0 ..< k where happiness[i] - i > 0 {
            answer += happiness[i] - i
        }
        
        return answer
    }
}
