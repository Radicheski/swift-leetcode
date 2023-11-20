//
//  MinimumAmountOfTimeToCollectGarbage.swift
//  https://leetcode.com/problems/minimum-amount-of-time-to-collect-garbage/
//
//  Created by Erik Radicheski da Silva on 20/11/23.
//

import XCTest

final class MinimumAmountOfTimeToCollectGarbage: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.garbageCollection(["G", "P", "GP", "GG"], [2, 4, 3]), 21)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.garbageCollection(["MMM", "PGM", "GP"], [3, 10]), 37)
    }

}

private class Solution {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var answer = 0
        var lastIndex = [Character: Int]()
        
        for (i, house) in garbage.map(Array.init).enumerated() {
            answer += house.count
            let set = Set(house)
            
            for type in ["M", "P", "G"] as [Character] {
                if set.contains(type) {
                    lastIndex[type] = i
                }
            }
        }
        
        for (i, time) in travel.enumerated() {
            for (type, truck) in lastIndex {
                if truck > i {
                    answer += time
                } else {
                    lastIndex[type] = nil
                }
            }
        }
        
        return answer
    }
}
