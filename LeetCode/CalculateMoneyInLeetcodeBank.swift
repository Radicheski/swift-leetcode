//
//  CalculateMoneyInLeetcodeBank.swift
//  https://leetcode.com/problems/calculate-money-in-leetcode-bank/
//
//  Created by Erik Radicheski da Silva on 06/12/23.
//

import XCTest

final class CalculateMoneyInLeetcodeBank: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA(){
        XCTAssertEqual(solution.totalMoney(4), 10)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.totalMoney(10), 37)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.totalMoney(20), 96)
    }
    
}

private class Solution {
    func totalMoney(_ n: Int) -> Int {
        var answer = 0
        
        let lastWeek = n % 7
        let fullWeeks = n / 7
        
        answer += (fullWeeks + 7) * fullWeeks * 7 / 2
        answer += (2 * fullWeeks + lastWeek + 1) * lastWeek / 2
        
        return answer
    }
}
