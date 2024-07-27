//
//  MinimumCostToConvertString1.swift
//  https://leetcode.com/problems/minimum-cost-to-convert-string-i/
//
//  Created by Erik Radicheski da Silva on 27/07/24.
//

import XCTest

final class MinimumCostToConvertString1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumCost("abcd", "acbe", ["a", "b", "c", "c", "e", "d"],
                                            ["b", "c", "b", "e", "b", "e"], [2, 5, 5, 1, 2, 20]), 28)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumCost("aaaa", "bbbb", ["a", "c"], ["c", "b"], [1, 2]), 12)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumCost("abcd", "abce", ["a"], ["e"], [10000]), -1)
    }
    
}

private class Solution {
    
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    func minimumCost(_ source: String, _ target: String, _ original: [Character],
                     _ changed: [Character], _ cost: [Int]) -> Int {
        var score = 0
        
        var costs = [Character: [Character: Int]]()
        let source = Array(source)
        let target = Array(target)
        
        for i in alphabet {
            for j in alphabet {
                costs[i, default: [:]][j] = .max / 2
            }
        }
        
        for (i, o) in original.enumerated() {
            let c = changed[i]
            costs[o]![c] = min(costs[o]![c]!, cost[i])
        }
        
        for i in alphabet {
            for j in alphabet {
                for k in alphabet {
                    costs[j]![k] = min(costs[j]![k]!, costs[j]![i]! + costs[i]![k]!)
                }
            }
        }
        
        for i in source.indices where source[i] != target[i] {
            guard costs[source[i]]![target[i]]! < .max / 2 else { return -1 }
            
            score += costs[source[i]]![target[i]]!
        }
        
        return score
    }
}
