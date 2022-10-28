//
//  CombinationSum.swift
//  https://leetcode.com/problems/combination-sum/
//
//  Created by Erik Radicheski da Silva on 28/10/22.
//

import XCTest

final class CombinationSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let expectedOutput = Set([[2, 2, 3], [7]])
        XCTAssertEqual(Set(solution.combinationSum([2, 3, 6, 7], 7)), expectedOutput)
    }
    
    func testExampleB() {
        let expectedOutput = Set([[2, 2, 2, 2], [2, 3, 3], [3, 5]])
        XCTAssertEqual(Set(solution.combinationSum([2, 3, 5], 8)), expectedOutput)
    }
    
    func testExampleC() {
        let expectedOutput = Set<[Int]>([])
        XCTAssertEqual(Set(solution.combinationSum([2], 1)), expectedOutput)
    }

}

private class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard target > 0 else { return [] }
        
        var result = Set<[Int]>()
        
        for i in 0 ..< candidates.endIndex {
            let lead = candidates[i]
            
            if lead == target { result.insert([lead]) }
            
            combinationSum(candidates, target - lead)
                .forEach {
                    var array = [lead]
                    array.append(contentsOf: $0)
                    result.insert(array.sorted())
                }
            
        }
        
        return Array(result)
    }
}
