//
//  DailyTemperatures.swift
//  https://leetcode.com/problems/daily-temperatures/
//
//  Created by Erik Radicheski da Silva on 06/01/23.
//

import XCTest

final class DailyTemperatures: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [73, 74, 75, 71, 69, 72, 76, 73]
        let output = [1, 1, 4, 2, 1, 1, 0, 0]
        XCTAssertEqual(solution.dailyTemperatures(input), output)
    }
    
    func testExampleB() {
        let input = [30, 40, 50, 60]
        let output = [1, 1, 1, 0]
        XCTAssertEqual(solution.dailyTemperatures(input), output)
    }
    
    func testExampleC() {
        let input = [30, 60, 90]
        let output = [1, 1, 0]
        XCTAssertEqual(solution.dailyTemperatures(input), output)
    }

}

private class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        
        var lastIndexes = [Int: Int]()
        
        for (index, temperature) in temperatures.enumerated().reversed() {
            lastIndexes[temperature] = index
            if let nextWarmDay = lastIndexes.filter( { $0.key > temperature } ).values.min() {
                result[index] = nextWarmDay - index
            }
        }
        
        return result
    }
}
