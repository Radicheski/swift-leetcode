//
//  CountDaysWithoutMeetings.swift
//  https://leetcode.com/problems/count-days-without-meetings/
//
//  Created by Erik Radicheski da Silva on 24/03/25.
//

import XCTest

final class CountDaysWithoutMeetings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countDays(10, [[5, 7], [1, 3], [9, 10]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countDays(5, [[2, 4], [1, 3]]), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.countDays(6, [[1, 6]]), 0)
    }
    
}

private class Solution {
    func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
        let meetings = meetings.sorted { $0[0] < $1[0] }
        var sequences = [[Int]]()
        
        for meeting in meetings {
            let lastIndex = sequences.endIndex - 1
            
            if lastIndex < 0 || meeting[0] > sequences[lastIndex][1] + 1{
                sequences.append(meeting)
            } else {
                sequences[lastIndex][1] = max(sequences[lastIndex][1], meeting[1])
            }
        }
        
        var count = sequences[0][0] - 1
        
        for i in sequences.indices where i > 0 {
            count += sequences[i][0] - sequences[i - 1][1] - 1
        }
        
        return count + days - sequences.last![1]
    }
}
