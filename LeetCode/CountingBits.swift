//
//  CountingBits.swift
//  https://leetcode.com/problems/counting-bits/
//
//  Created by Erik Radicheski da Silva on 01/09/23.
//

import XCTest

final class CountingBits: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.countBits(2), [0, 1, 1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.countBits(5), [0, 1, 1, 2, 1, 2])
    }

}

private class Solution {
    func countBits(_ n: Int) -> [Int] {
        var answer = Array(repeating: 0, count: n + 1)
        
        for i in 0 ... n {
            var mask = 1
            while mask <= i {
                if i & mask > 0 {
                    answer[i] += 1
                }
                mask <<= 1
            }
        }
        
        return answer
    }
}
