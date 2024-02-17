//
//  FurthestBuildingYouCanReach.swift
//  https://leetcode.com/problems/furthest-building-you-can-reach/
//
//  Created by Erik Radicheski da Silva on 17/02/24.
//

import XCTest

final class FurthestBuildingYouCanReach: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.furthestBuilding([4, 2, 7, 6, 9, 14, 12], 5, 1), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.furthestBuilding([4, 12, 2, 7, 3, 18, 20, 3, 19], 10, 2), 7)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.furthestBuilding([14, 3, 19, 3], 17, 0), 3)
    }
    
}

private class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        var heightDiffs = [Int]()
        var bricks = bricks
        
        for i in 0 ..< heights.endIndex - 1 {
            let diff = heights[i + 1] - heights[i]
            
            guard diff > 0 else { continue }
            
            add(diff, to: &heightDiffs)
            
            if heightDiffs.count > ladders {
                bricks -= heightDiffs.removeLast()
            }
            
            guard bricks >= 0 else { return i }
        }
        
        return heights.endIndex - 1
    }
    
    private func add(_ diff: Int, to heightDiffs: inout [Int]) {
        var left = 0
        var right = heightDiffs.endIndex
        
        while left < right {
            let middle = left + (right - left) / 2
            
            if heightDiffs[middle] > diff {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        heightDiffs.insert(diff, at: left)
    }
}
