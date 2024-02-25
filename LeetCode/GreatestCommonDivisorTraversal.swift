//
//  GreatestCommonDivisorTraversal.swift
//  https://leetcode.com/problems/greatest-common-divisor-traversal/
//
//  Created by Erik Radicheski da Silva on 25/02/24.
//

import XCTest

final class GreatestCommonDivisorTraversal: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canTraverseAllPairs([2, 3, 6]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canTraverseAllPairs([3, 9, 5]))
    }
    
    func testExampleC() {
        XCTAssertTrue(solution.canTraverseAllPairs([4, 3, 12, 8]))
    }
    
}

private class Solution {
    private let max = 100_000
    
    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        guard nums.allSatisfy( { $0 > 1 } ) else { return false }
        
        var sieve = Array(repeating: 0, count: max + 1)
        
        for d in 2 ... max {
            if sieve[d] == 0 {
                for v in stride(from: d, through: max, by: d) {
                    sieve[v] = d
                }
            }
        }
        
        var set = DSU(2 * max + 1)
        for num in nums {
            var value = num
            
            while value > 1 {
                let prime = sieve[value]
                let root = prime + max
                
                while value.isMultiple(of: prime) {
                    value /= prime
                }
                
                guard set.find(root) != set.find(num) else { continue }
                
                set.merge(root, num)
            }
        }
        
        var count = 0
        
        for num in Set(nums) {
            guard set.find(num) == num else { continue }
            
            count += 1
        }
        
        return count == 1
    }
}

private struct DSU {
    private var set: [Int]
    private var size: [Int]

    init(_ size: Int) {
        self.set = Array(0 ... size)
        self.size = Array(repeating: 1, count: size + 1)
    }
    
    mutating func find(_ x: Int) -> Int {
        guard set[x] != x else { return x }
        
        let parent = find(set[x])
        set[x] = parent
        
        return parent
    }
    
    mutating func merge(_ x: Int, _ y: Int) {
        var fx = find(x)
        var fy = find(y)
        
        if fx == fy {
            return
        }
        
        if size[fx] > size[fy] {
            let temp = fx
            fx = fy
            fy = temp
        }
        
        set[fx] = fy
        size[fy] += size[fx]
    }
}
