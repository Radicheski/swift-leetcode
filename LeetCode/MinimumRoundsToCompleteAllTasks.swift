//
//  MinimumRoundsToCompleteAllTasks.swift
//  https://leetcode.com/problems/minimum-rounds-to-complete-all-tasks/
//
//  Created by Erik Radicheski da Silva on 04/01/23.
//

import XCTest

final class MinimumRoundsToCompleteAllTasks: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumRounds([2, 2, 3, 3, 2, 4, 4, 4, 4, 4]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumRounds([2, 3, 3]), -1)
    }

}

private class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        let tasks = Dictionary(tasks.map { ($0, 1) }, uniquingKeysWith: +)
        
        guard tasks.values.allSatisfy( { $0 > 1 } ) else { return -1 }
        
        var rounds = 0
        
        for (_, quantity) in tasks {
            var tripleTask = quantity / 3
            var doubleTask = (quantity - 3 * tripleTask) / 2
            
            while 3 * tripleTask + 2 * doubleTask != quantity {
                tripleTask -= 1
                doubleTask = (quantity - 3 * tripleTask) / 2
            }
            
            rounds += tripleTask + doubleTask
        }
        
        return rounds
    }
}
