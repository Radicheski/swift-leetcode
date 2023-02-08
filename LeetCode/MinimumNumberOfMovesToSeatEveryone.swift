//
//  MinimumNumberOfMovesToSeatEveryone.swift
//  https://leetcode.com/problems/minimum-number-of-moves-to-seat-everyone/
//
//  Created by Erik Radicheski da Silva on 08/02/23.
//

import XCTest

final class MinimumNumberOfMovesToSeatEveryone: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minMovesToSeat([3, 1, 5], [2, 7, 4]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minMovesToSeat([4, 1, 5, 9], [1, 3, 2, 6]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minMovesToSeat([2, 2, 6, 6], [1, 3, 2, 6]), 4)
    }
    
}

private class Solution {
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let seats = seats.sorted()
        let students = students.sorted()
        
        var totalMoves = 0
        
        for i in seats.indices {
            totalMoves += abs(seats[i] - students[i])
        }
        
        return totalMoves
    }
}
