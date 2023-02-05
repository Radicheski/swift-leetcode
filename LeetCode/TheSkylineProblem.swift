//
//  TheSkylineProblem.swift
//  https://leetcode.com/problems/the-skyline-problem/
//
//  Created by Erik Radicheski da Silva on 05/02/23.
//

import XCTest

final class TheSkylineProblem: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getSkyline([[2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8]]),
                       [[2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getSkyline([[0, 2, 3], [2, 5, 3]]), [[0, 3], [5, 0]])
    }

}

private class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        var start = [Int: [Int]]()
        var end = [Int: [Int]]()
        var points = [Int: Bool]()
        var queue = [Int: Int]()
        
        var height = 0
        
        for (i, building) in buildings.enumerated() {
            start[building[0], default: []].append(i)
            end[building[1], default: []].append(i)
            points[building[0]] = true
            points[building[1]] = true
        }
        
        for point in points.keys.sorted() {
            for i in start[point] ?? [] {
                queue[i] = buildings[i][2]
            }
            
            for i in end[point] ?? [] {
                queue[i] = nil
            }
            
            let newHeight = queue.values.max() ?? 0
            if newHeight != height {
                height = newHeight
                result.append([point, height])
            }
        }
        
        return result
    }
}
