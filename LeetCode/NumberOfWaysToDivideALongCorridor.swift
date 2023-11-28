//
//  NumberOfWaysToDivideALongCorridor.swift
//  https://leetcode.com/problems/number-of-ways-to-divide-a-long-corridor/
//
//  Created by Erik Radicheski da Silva on 28/11/23.
//

import XCTest

final class NumberOfWaysToDivideALongCorridor: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfWays("SSPPSPS"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfWays("PPSPSP"), 1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfWays("S"), 0)
    }
    
}

private class Solution {
    
    private let mod = 1_000_000_007
    
    func numberOfWays(_ corridor: String) -> Int {
        let corridor = Array(corridor)
        
        let seats = corridor.filter( { $0 == "S" } ).count
        guard seats > 0 && seats.isMultiple(of: 2) else { return 0 }
        
        let seatIndices = corridor.enumerated().filter { $0.element == "S" }.map { $0.offset }
        
        var answer = 1
        
        for i in stride(from: 2, to: seatIndices.endIndex, by: 2) {
            answer *= seatIndices[i] - seatIndices[i - 1]
            answer %= mod
        }
        
        return answer
    }
}
