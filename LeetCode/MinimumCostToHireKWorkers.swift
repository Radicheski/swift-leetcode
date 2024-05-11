//
//  MinimumCostToHireKWorkers.swift
//  https://leetcode.com/problems/minimum-cost-to-hire-k-workers/
//
//  Created by Erik Radicheski da Silva on 11/05/24.
//

import XCTest

final class MinimumCostToHireKWorkers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mincostToHireWorkers([10,20,5], [70,50,30], 2), 105, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mincostToHireWorkers([3,1,10,10,1], [4,8,2,2,7], 3), 30.66667, accuracy: 1e-5)
    }
    
}

private class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        let workers = quality.indices
            .map { (quality: quality[$0], ratio: Double(wage[$0]) / Double(quality[$0])) }
            .sorted { $0.ratio < $1.ratio }
        
        var totalCost = Double.infinity
        var totalQuality = 0
        var qualityQueue = [(quality: Int, ratio: Double)]()
        
        for worker in workers {
            if let index = qualityQueue.firstIndex(where: { $0.quality > worker.quality } ) {
                qualityQueue.insert(worker, at: index)
            } else {
                qualityQueue.append(worker)
            }
            
            totalQuality += worker.quality
            
            if qualityQueue.count > k {
                totalQuality -= qualityQueue.removeLast().quality
            }
            
            if qualityQueue.count == k {
                totalCost = min(totalCost, Double(totalQuality) * worker.ratio)
            }
        }
        
        return totalCost
    }
}
