//
//  NumberOfLaserBeamsInABank.swift
//  https://leetcode.com/problems/number-of-laser-beams-in-a-bank/
//
//  Created by Erik Radicheski da Silva on 03/01/24.
//

import XCTest

final class NumberOfLaserBeamsInABank: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfBeams(["011001", "000000", "010100", "001000"]), 8)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfBeams(["000", "111", "000"]), 0)
    }
    
}

private class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var bank = bank.map { row in row.filter { $0 == "1" }.count }
        bank.removeAll { $0 == 0 }
        
        guard bank.count > 1 else { return 0 }
        
        var answer = 0
        
        for i in 1 ..< bank.endIndex {
            answer += bank[i - 1] * bank[i]
        }
        
        return answer
    }
}
