//
//  LastMomentBeforeAllAntsFallOutOfAPlank.swift
//  https://leetcode.com/problems/last-moment-before-all-ants-fall-out-of-a-plank/description/?envType=daily-question&envId=2023-11-04
//
//  Created by Erik Radicheski da Silva on 03/11/23.
//

import XCTest

final class LastMomentBeforeAllAntsFallOutOfAPlank: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getLastMoment(4, [4, 3], [0, 1]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getLastMoment(7, [], [0, 1, 2, 3, 4, 5, 6, 7]), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getLastMoment(7, [0, 1, 2, 3, 4, 5, 6, 7], []), 7)
    }

}

private class Solution {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        var answer = Int.min
        
        for ant in left {
            answer = max(answer, ant)
        }
        
        for ant in right {
            answer = max(answer, n - ant)
        }
        
        return answer
    }
}
