//
//  MakeArrayStrictlyIncreasing.swift
//  https://leetcode.com/problems/make-array-strictly-increasing/
//
//  Created by Erik Radicheski da Silva on 17/06/23.
//

import XCTest

final class MakeArrayStrictlyIncreasing: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.makeArrayIncreasing([1, 5, 3, 6, 7], [1, 3, 2, 4]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.makeArrayIncreasing([1, 5, 3, 6, 7], [4, 3, 1]), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.makeArrayIncreasing([1, 5, 3, 6, 7], [1, 6, 3, 3]), -1)
    }
    
}

private class Solution {
    
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let arr2 = arr2.sorted()
        var dp = [[Int]: Int]()
        
        let answer = depthFirst(0, -1, arr1, arr2, &dp)
        
        return answer == .max ? -1 : answer
    }
    
    private func depthFirst(_ i: Int, _ prev: Int, _ arr1: [Int],
                            _ arr2: [Int], _ dp: inout [[Int]: Int]) -> Int {
        guard arr1.indices.contains(i) else { return 0 }
        
        if let answer = dp[[i, prev]] {
            return answer
        }
        
        var cost: Int = .max
        
        if arr1[i] > prev {
            cost = depthFirst(i + 1, arr1[i], arr1, arr2, &dp)
        }
        
        let index = binarySearch(arr2, prev)
        
        if arr2.indices.contains(index) {
            let newCost = depthFirst(i + 1, arr2[index], arr1, arr2, &dp)
            if newCost < .max {
                cost = min(cost, 1 + newCost)
            }
        }
        
        dp[[i, prev]] = cost
        
        return cost
    }
    
    private func binarySearch(_ arr: [Int], _ value: Int) -> Int {
        var left = 0
        var right = arr.endIndex
        
        while left < right {
            let middle = left + (right - left) / 2
            if arr[middle] <= value {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return left
    }
}
