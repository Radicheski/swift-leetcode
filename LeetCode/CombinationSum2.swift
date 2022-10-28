//
//  CombinationSum2.swift
//  https://leetcode.com/problems/combination-sum-ii/
//
//  Created by Erik Radicheski da Silva on 28/10/22.
//

import XCTest

final class CombinationSum2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let expectedOutput = Set([[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]])
        XCTAssertEqual(Set(solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8)), expectedOutput)
    }
    
    func testExampleB() {
        let expectedOutput = Set([[1, 2, 2], [5]])
        XCTAssertEqual(Set(solution.combinationSum2([2, 5, 2, 1, 2], 5)), expectedOutput)
    }
    
    func test() {
        measure {
            let _ = solution.combinationSum2([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], 27)
        }
    }

}

private class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        
        var results = [[Int]]()
        var combination = [Int]()
        
        backtracking(candidates, &combination, target, 0, &results)
        
        return results
    }
    
    private func backtracking(_ candidates: [Int],
                              _ combination: inout [Int],
                              _ remain: Int,
                              _ current: Int,
                              _ results: inout [[Int]]) {
        if remain == 0 {
            results.append(combination)
            return
        }
        
        for next in current ..< candidates.endIndex {
            if next > current && candidates[next] == candidates[next - 1] {
                continue
            }
            
            let int = candidates[next]
            
            guard int <= remain else { break }
            
            combination.append(int)
            backtracking(candidates, &combination, remain - int, next + 1, &results)
            let _ = combination.removeLast()
        }
        
    }
}
