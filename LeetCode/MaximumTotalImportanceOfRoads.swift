//
//  MaximumTotalImportanceOfRoads.swift
//  https://leetcode.com/problems/maximum-total-importance-of-roads/
//
//  Created by Erik Radicheski da Silva on 28/06/24.
//

import XCTest

final class MaximumTotalImportanceOfRoads: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumImportance(5, [[0, 1], [1, 2], [2, 3], [0, 2], [1, 3], [2, 4]]), 43)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumImportance(5, [[0, 3], [2, 4], [1, 3]]), 20)
    }
    
}

private class Solution {
    func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
        var cities = [Int: Int]()
        
        for road in roads {
            cities[road[0], default: 0] += 1
            cities[road[1], default: 0] += 1
        }
        
        var importance = 0
        var n = n
        
        for city in cities.values.sorted(by: >) {
            importance += city * n
            n -= 1
        }
        
        return importance
    }
}
