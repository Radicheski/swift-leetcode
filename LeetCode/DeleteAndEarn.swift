//
//  DeleteAndEarn.swift
//  https://leetcode.com/problems/delete-and-earn/
//
//  Created by Erik Radicheski da Silva on 01/12/22.
//

import XCTest

final class DeleteAndEarn: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.deleteAndEarn([3, 4, 2]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.deleteAndEarn([2, 2, 3, 3, 3, 4]), 9)
    }
    
}

private class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        let pointsByNumber = Dictionary(nums.map { ($0, $0) }, uniquingKeysWith: +)
        
        var previous = 0
        var current = 0
        
        for (number, points) in pointsByNumber.sorted(by: { $0.key < $1.key } ) {
            if pointsByNumber[number - 1] == nil {
                previous = current
                current += points
            } else {
                let newCurrent = max(previous + points, current)
                
                previous = current
                current = newCurrent
            }
        }
        
        return current
    }
}
