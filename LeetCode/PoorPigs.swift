//
//  PoorPigs.swift
//  https://leetcode.com/problems/poor-pigs/
//
//  Created by Erik Radicheski da Silva on 29/10/23.
//

import XCTest

final class PoorPigs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.poorPigs(4, 15, 15), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.poorPigs(4, 15, 30), 2)
    }

}

private class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let rounds = Double(minutesToTest) / Double(minutesToDie) + 1
        let buckets = Double(buckets)
    
        let answer = log(buckets) / log(rounds)
        
        return Int(answer) + (answer.truncatingRemainder(dividingBy: 1) > 0.001 ? 1 : 0)
        
    }
}
