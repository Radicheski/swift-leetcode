//
//  EvaluateDivision.swift
//  https://leetcode.com/problems/evaluate-division/
//
//  Created by Erik Radicheski da Silva on 20/05/23.
//

import XCTest

final class EvaluateDivision: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.calcEquation([["a", "b"], ["b", "c"]], [2, 3],
                                             [["a", "c"], ["b", "a"], ["a", "e"],
                                              ["a", "a"], ["x", "x"]]),
                       [6, 0.5, -1, 1, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.calcEquation([["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0],
                                             [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]]),
                       [3.75, 0.4, 5, 0.2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.calcEquation([["a", "b"]], [0.5],
                                             [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]]),
                       [0.5, 2, -1, -1])
    }

}

private class Solution {
    
    private let cannotAnswer = -1.0
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var answer = Array(repeating: cannotAnswer, count: queries.count)
        var divisions = [String: [String: Double]]()
        var visited = Set<[String]>()
        
        for (i, equation) in equations.enumerated() {
            divisions[equation[0], default: [:]][equation[1]] = values[i]
            divisions[equation[1], default: [:]][equation[0]] = 1 / values[i]
        }
        
        for (i, query) in queries.enumerated() {
            answer[i] = division(query[0], query[1], &divisions, &visited)
        }
        
        return answer
    }
    
    private func division(_ dividend: String, _ divisor: String,
                          _ divisions: inout [String: [String: Double]],
                          _ visited: inout Set<[String]>) -> Double {
        guard visited.contains([dividend, divisor]) == false else {
            return divisions[dividend]?[divisor] ?? cannotAnswer
        }
        
        visited.insert([dividend, divisor])
        
        if let result = divisions[dividend]?[divisor] { return result }
        
        guard let divisors = divisions[dividend] else { return 1 / division(divisor, dividend, &divisions, &visited) }
        
        for (newDivisor, value) in divisors {
            let newValue = division(newDivisor, divisor, &divisions, &visited)
            
            guard newValue != cannotAnswer else { continue }
            
            divisions[dividend, default: [:]][divisor] = value * newValue
            divisions[divisor, default: [:]][dividend] = 1 / (value * newValue)
            
            return value * newValue
        }
        
        return cannotAnswer
    }
}
