//
//  SumOfSubarrayMinimums.swift
//  https://leetcode.com/problems/sum-of-subarray-minimums/
//
//  Created by Erik Radicheski da Silva on 20/01/24.
//

import XCTest

final class SumOfSubarrayMinimums: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sumSubarrayMins([3, 1, 2, 4]), 17)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sumSubarrayMins([11, 81, 94, 43, 3]), 444)
    }
    
}

private class Solution {
    
    private typealias Pair = (number: Int, count: Int)
    
    private let mod = 1_000_000_007
    
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var left = Array(repeating: 0, count: arr.count)
        var right = Array(repeating: 0, count: arr.count)
        
        var s1 = [Pair]()
        var s2 = [Pair]()
        
        for i in arr.indices {
            var count = 1
            
            while let last = s1.last, last.number > arr[i] {
                count += last.count
                s1.removeLast()
            }
            
            s1.append((arr[i], count))
            left[i] = count
        }
        
        for i in arr.indices.reversed() {
            var count = 1
            
            while let last = s2.last, last.number >= arr[i] {
                count += last.count
                s2.removeLast()
            }
            
            s2.append((arr[i], count))
            right[i] = count
        }
        
        return arr.enumerated()
            .map { $0.element * left[$0.offset] * right[$0.offset] % mod }
            .reduce(into: 0, +=) % mod
    }
}
