//
//  LastStoneWeight.swift
//  https://leetcode.com/problems/last-stone-weight/
//
//  Created by Erik Radicheski da Silva on 30/08/22.
//

import XCTest

class LastStoneWeight: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lastStoneWeight([2, 7, 4, 1, 8, 1]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lastStoneWeight([1]), 1)
    }

}

private class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones.sorted(by: >)
        
        while stones.count > 1 {
            let stoneA = stones.removeFirst()
            let stoneB = stones.removeFirst()
            
            if stoneA == stoneB {
                continue
            } else {
                let newStone = abs(stoneA - stoneB)
                stones.append(newStone)
                stones.sort(by: >)
            }
        }
        
        return stones.isEmpty ? 0 : stones.removeFirst()
    }
}
