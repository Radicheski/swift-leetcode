//
//  Permutations.swift
//  https://leetcode.com/problems/permutations/
//
//  Created by Erik Radicheski da Silva on 24/09/22.
//

import XCTest

final class Permutations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [1, 2, 3]
        let output = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        XCTAssertEqual(solution.permute(input), output)
    }
    
    func testExampleB() {
        let input = [0, 1]
        let output = [[0, 1], [1, 0]]
        XCTAssertEqual(solution.permute(input), output)
    }
    
    func testExampleC() {
        let input = [1]
        let output = [[1]]
        XCTAssertEqual(solution.permute(input), output)
    }

}

private class Solution {
    
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else {
            return nums.reduce(into: [[Int]]()) { $0.append([$1]) }
        }
        
        var result = [[Int]] ()
        
        for (index, number) in nums.enumerated() {
            var subArray = nums
            subArray.remove(at: index)
            permute(subArray).forEach {
                var newArray = [number]
                newArray.append(contentsOf: $0)
                result.append(newArray)
            }
        }
        
        return result
    }
    
}
