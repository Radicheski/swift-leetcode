//
//  FindMissingObservations.swift
//  https://leetcode.com/problems/find-missing-observations/
//
//  Created by Erik Radicheski da Silva on 05/09/24.
//

import XCTest

final class FindMissingObservations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.missingRolls([3, 2, 4, 3], 4, 2), [6, 6])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.missingRolls([1, 5, 6], 3, 4), [2, 3, 2, 2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.missingRolls([1, 2, 3, 4], 6, 4), [])
    }
    
}

private class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let sum = rolls.reduce(into: (rolls.count + n) * mean, -=)
        
        guard sum >= n else { return [] }
        if sum > 6 * n { return [] }
        
        var answer = Array(repeating: 0, count: n)
        
        for i in 0 ..< sum {
            answer[i % n] += 1
        }
        
        return answer
    }
}
