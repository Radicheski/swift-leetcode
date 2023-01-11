//
//  TimeNeededToInformAllEmployees.swift
//  https://leetcode.com/problems/time-needed-to-inform-all-employees/
//
//  Created by Erik Radicheski da Silva on 11/01/23.
//

import XCTest

final class TimeNeededToInformAllEmployees: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numOfMinutes(1, 0, [-1], [0]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numOfMinutes(6, 2, [2, 2, -1, 2, 2, 2], [0, 0, 1, 0, 0, 0]), 1)
    }

}

private class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        let hierarchy = manager.enumerated().reduce(into: [Int: [Int]]()) { dictionary, employee in
            dictionary[employee.element, default: []].append(employee.offset)
        }
        
        var time = Array(repeating: -1, count: n)
        time[headID] = 0
        
        var nextManager = [headID]
        
        while nextManager.isEmpty == false {
            let manager = nextManager.removeFirst()
            
            if let employees = hierarchy[manager] {
                
                nextManager.append(contentsOf: employees)
                
                for employee in employees {
                    time[employee] = time[manager] + informTime[manager]
                }
            }
        
        }
        
        return time.max()!
    }
}
