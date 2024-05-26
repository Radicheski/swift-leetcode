//
//  StudentAttendanceRecord2.swift
//  https://leetcode.com/problems/student-attendance-record-ii/
//
//  Created by Erik Radicheski da Silva on 26/05/24.
//

import XCTest

final class StudentAttendanceRecord2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.checkRecord(2), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.checkRecord(1), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.checkRecord(10101), 183236316)
    }
    
}

private class Solution {
    private let mod = 1_000_000_007
    
    func checkRecord(_ n: Int) -> Int {
        var memo: [[[Int?]]] = Array(repeating: Array(repeating: Array(repeating: nil, count: 3), count: 2), count: n + 1)
        return validCombiations(n, 0, 0, &memo)
    }
    
    private func validCombiations(_ n: Int, _ absences: Int, _ late: Int, _ memo: inout [[[Int?]]]) -> Int {
        guard absences < 2 else { return 0 }
        guard late < 3 else { return 0 }
        
        guard n > 0 else { return 1 }
        
        if let answer = memo[n][absences][late] {
            return answer
        }
        
        var count = 0
        
        count += validCombiations(n - 1, absences, 0, &memo)
        
        count += validCombiations(n - 1, absences + 1, 0, &memo)
        count %= mod
        
        count += validCombiations(n - 1, absences, late + 1, &memo)
        count %= mod
        
        memo[n][absences][late] = count
        
        return count
    }
}
