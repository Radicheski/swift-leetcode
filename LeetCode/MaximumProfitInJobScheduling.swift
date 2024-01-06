//
//  MaximumProfitInJobScheduling.swift
//  https://leetcode.com/problems/maximum-profit-in-job-scheduling/
//
//  Created by Erik Radicheski da Silva on 06/01/24.
//

import XCTest

final class MaximumProfitInJobScheduling: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.jobScheduling([1, 2, 3, 3], [3, 4, 5, 6], [50, 10, 40, 70]), 120)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.jobScheduling([1, 2, 3, 4, 6], [3, 5, 10, 6, 9], [20, 20, 100, 70, 60]), 150)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.jobScheduling([1, 1, 1], [2, 3, 4], [5, 6, 4]), 6)
    }
}

private class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let arr = startTime.indices
            .map { (start: startTime[$0], end: endTime[$0], profit: profit[$0]) }
            .sorted { $0.end < $1.end }
        
        let n = arr.count
        var table = Array(repeating: 0, count: n)
        table[0] = arr[0].profit
 
        for i in 1 ..< n {
            var inclProf = arr[i].profit;
            if let l = latestPreviousJob(i, arr) {
                inclProf += table[l];
            }
 
            table[i] = max(inclProf, table[i - 1]);
        }
 
        let result = table[n - 1];
 
        return result;
    }
    
    private func latestPreviousJob(_ job: Int, _ jobs: [(start: Int, end: Int, profit: Int)]) -> Int? {
        var left = 0
        var right = job
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if jobs[middle].end <= jobs[job].start {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return left == 0 ? nil : left - 1
    }
}
