//
//  MaximumRunningTimeOfNComputers.swift
//  https://leetcode.com/problems/maximum-running-time-of-n-computers/
//
//  Created by Erik Radicheski da Silva on 27/07/23.
//

import XCTest

final class MaximumRunningTimeOfNComputers: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxRunTime(2, [3, 3, 3]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxRunTime(2, [1, 1, 1, 1]), 2)
    }

}

private class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        let batteries = batteries.sorted()
        
        var extra = 0
        for i in 0 ..< batteries.endIndex - n {
            extra += batteries[i]
        }
        
        let live = Array(batteries[(batteries.endIndex - n)...])
        
        for i in 0 ..< n - 1 {
            if extra < (i + 1) * (live[i + 1] - live[i]) {
                return live[i] + extra / (i + 1)
            }
            
            extra -= (i + 1) * (live[i + 1] - live[i])
        }
        
        return live[n - 1] + extra / n
    }
}
