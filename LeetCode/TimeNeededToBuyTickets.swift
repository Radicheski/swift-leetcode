//
//  TimeNeededToBuyTickets.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 09/04/24.
//

import XCTest

final class TimeNeededToBuyTickets: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.timeRequiredToBuy([2, 3, 2], 2), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.timeRequiredToBuy([5, 1, 1, 1], 0), 8)
    }
    
}

private class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var tickets = tickets
        var time = 0
        var i = 0
        
        while tickets[k] > 0 {
            if tickets[i] > 0 {
                tickets[i] -= 1
                time += 1
            }
            
            i += 1
            i %= tickets.count
        }
        
        return time
    }
}
