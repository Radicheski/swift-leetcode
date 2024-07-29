//
//  CountNumberOfTeams.swift
//  https://leetcode.com/problems/count-number-of-teams/
//
//  Created by Erik Radicheski da Silva on 29/07/24.
//

import XCTest

final class CountNumberOfTeams: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numTeams([2, 5, 3, 4, 1]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numTeams([2, 1, 3]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numTeams([1, 2, 3, 4]), 4)
    }
    
    func test() {
        var rating = Set<Int>()
        
        while rating.count < 1000 {
            rating.insert(Int.random(in: 1 ... 100_000))
        }
        
        measure {
            let _ = solution.numTeams(Array(rating))
        }
    }
    
}

private class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        var count = 0
        
        var increasing = Array(repeating: Array(repeating: 0, count: 4), count: rating.count)
        var decreasing = Array(repeating: Array(repeating: 0, count: 4), count: rating.count)
        
        for i in 0 ..< rating.endIndex {
            increasing[i][1] = 1
            decreasing[i][1] = 1
        }
        
        for c in 2 ... 3 {
            for i in 0 ..< rating.endIndex {
                for j in i + 1 ..< rating.endIndex {
                    if rating[j] > rating[i] {
                        increasing[j][c] += increasing[i][c - 1]
                    }
                    
                    if rating[j] < rating[i] {
                        decreasing[j][c] += decreasing[i][c - 1]
                    }
                }
            }
        }
        
        for i in 0 ..< rating.endIndex {
            count += increasing[i][3] + decreasing[i][3]
        }
        
        return count
    }
}
