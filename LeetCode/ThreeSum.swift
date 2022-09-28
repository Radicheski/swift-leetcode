//
//  ThreeSum.swift
//  https://leetcode.com/problems/3sum/
//
//  Created by Erik Radicheski da Silva on 28/09/22.
//

import XCTest

final class ThreeSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(checkEquality(solution.threeSum([-1, 0, 1, 2, -1, -4]), [[-1, -1, 2], [-1, 0, 1]]))
    }
    
    func testExampleB() {
        XCTAssertTrue(checkEquality(solution.threeSum([0, 1, 1]), []))
    }
    
    func testExampleC() {
        XCTAssertTrue(checkEquality(solution.threeSum([0, 0, 0]), [[0, 0, 0]]))
    }
    
    private func checkEquality(_ arrayA: [[Int]], _ arrayB: [[Int]]) -> Bool {
        guard arrayA.count == arrayB.count else { return false }
        
        var sortedA = arrayA.map { $0.sorted() }
        var sortedB = arrayB.map { $0.sorted() }
        
        for i in 0 ..< sortedA.count {
            if sortedA.contains(where: sortedB.contains) {
                continue
            } else {
                return false
            }
        }
        
        return true
    }
    }

}

private class Solution {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let array = nums.sorted()
        
        var result = Set<[Int]>()
        
        for index in 0 ..< array.count - 2 {
            var left = index + 1
            var right = array.count - 1
            
            while left < right {
                let triplet = [array[index], array[left], array[right]]
                let sum = triplet.reduce(into: 0, +=)
                if sum == 0 {
                    result.insert(triplet)
                    left += 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return Array(result)
    }
    
}
