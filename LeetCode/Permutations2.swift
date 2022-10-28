//
//  Permutations2.swift
//  https://leetcode.com/problems/permutations-ii/
//
//  Created by Erik Radicheski da Silva on 28/10/22.
//

import XCTest

final class Permutations2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [1, 1, 2]
        let expectedOutput = [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
            .map(Set.init)
            .reduce(into: Set<Set<Int>>()) { let _ = $0.insert($1) }
        let output = solution.permuteUnique(input)
            .map(Set.init)
            .reduce(into: Set<Set<Int>>()) { let _ = $0.insert($1) }
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleB() {
        let input = [1, 1, 2]
        let expectedOutput = [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
            .map(Set.init)
            .reduce(into: Set<Set<Int>>()) { let _ = $0.insert($1) }
        let output = solution.permuteUnique(input)
            .map(Set.init)
            .reduce(into: Set<Set<Int>>()) { let _ = $0.insert($1) }
        XCTAssertEqual(output, expectedOutput)
    }

}

private class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        guard nums.isEmpty == false else { return [] }
        guard nums.count > 1 else { return [nums] }
        
        var nums = nums
        var result = [[Int]]()
        
        for _ in 0 ..< nums.count {
            let first = nums.removeFirst()
            
            permuteUnique(nums)
                .forEach {
                    var newNums = [first]
                    newNums.append(contentsOf: $0)
                    result.append(newNums)
                }
            
            nums.append(first)
            
        }
        
        return Array(Set(result))
    }
}
