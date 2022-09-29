//
//  MergeIntervals.swift
//  https://leetcode.com/problems/merge-intervals/
//
//  Created by Erik Radicheski da Silva on 29/09/22.
//

import XCTest

final class MergeIntervals: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.merge([[1, 3], [2, 6], [8, 10], [15, 18]]), [[1, 6],[8, 10], [15, 18]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.merge([[1, 4], [4, 5]]), [[1, 5]])
    }

}

private class Solution {
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted { $0[0] < $1[0] }
        
        var index = 0
        
        while index < intervals.endIndex - 1 {
            let first = intervals.remove(at: index)
            let second = intervals.remove(at: index)
            
            if isOverlapping(first, second) {
                let merged = merge(first, second)
                intervals.insert(contentsOf: merged, at: index)
            } else {
                intervals.insert(second, at: index)
                intervals.insert(first, at: index)
                index += 1
            }
        }
        
        return intervals
    }
    
    private func merge(_ rangeA: [Int], _ rangeB: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        if isOverlapping(rangeA, rangeB) {
            var newRange = [Int]()
            newRange.append(min(rangeA.min()!, rangeB.min()!))
            newRange.append(max(rangeA.max()!, rangeB.max()!))
            result.append(newRange)
        } else {
            result.append(rangeA)
            result.append(rangeB)
        }
        
        return result
    }
    
    private func isOverlapping(_ rangeA: [Int], _ rangeB: [Int]) -> Bool {
        guard rangeA.count == 2 && rangeB.count == 2 else { return false }
        
        return (rangeA[0] ... rangeA[1]).overlaps(rangeB[0] ... rangeB[1])
    }
    
}
