//
//  CountOfMatchesInTournament.swift
//  https://leetcode.com/problems/count-of-matches-in-tournament/
//
//  Created by Erik Radicheski da Silva on 05/12/23.
//

import XCTest

final class CountOfMatchesInTournament: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfMatches(7), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfMatches(14), 13)
    }
    
}

private class Solution {
    func numberOfMatches(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        
        if n.isMultiple(of: 2) {
            return numberOfMatches(n / 2) + (n / 2)
        } else {
            return numberOfMatches((n - 1) / 2 + 1) + ((n - 1) / 2)
        }
    }
}
