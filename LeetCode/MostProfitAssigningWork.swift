//
//  MostProfitAssigningWork.swift
//  https://leetcode.com/problems/most-profit-assigning-work/
//
//  Created by Erik Radicheski da Silva on 18/06/24.
//

import XCTest

final class MostProfitAssigningWork: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxProfitAssignment([2, 4, 6, 8, 10], [10, 20, 30, 40, 50], [4, 5, 6, 7]), 100)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxProfitAssignment([85, 47, 57], [24, 66, 99], [40, 25, 25]), 0)
    }
    
}

private class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        let jobProfile = difficulty.enumerated().map { ($0.element, profit[$0.offset]) }.sorted { $0.0 < $1.0 }
        let worker = worker.sorted()
        
        var totalProfit = 0
        var jobProfit = 0
        var index = 0
        
        for ability in worker {
            while jobProfile.indices.contains(index) && jobProfile[index].0 <= ability {
                jobProfit = max(jobProfit, jobProfile[index].1)
                index += 1
            }
            
            totalProfit += jobProfit
         }
        
        return totalProfit
    }
}
