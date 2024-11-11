//
//  PrimeSubtractionOperation.swift
//  https://leetcode.com/problems/prime-subtraction-operation/
//
//  Created by Erik Radicheski da Silva on 11/11/24.
//

import XCTest

final class PrimeSubtractionOperation: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.primeSubOperation([4, 9, 6, 10]))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.primeSubOperation([6, 8, 11, 12]))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.primeSubOperation([5, 8, 3]))
    }
    
}

private class Solution {
    func primeSubOperation(_ nums: [Int]) -> Bool {
        var memo = [Int: Bool]()
        var nums = nums
        
        for i in nums.indices {
            let bound = i == 0 ? nums[0] : nums[i] - nums[i - 1]
            
            guard bound > 0 else { return false }
            
            var largestPrime = 0
            for j in stride(from: bound - 1, through: 2, by: -1) {
                if isPrime(j, &memo) {
                    largestPrime = j
                    break
                }
            }
            
            nums[i] -= largestPrime
        }
                
        return true
    }
    
    private func isPrime(_ x: Int, _ memo: inout [Int: Bool]) -> Bool {
        if let answer = memo[x] {
            return answer
        }
        
        var i = 2
        while i * i <= x {
            if x.isMultiple(of: i) {
                memo[x] = false
                return false
            }
            i += 1
        }
        
        memo[x] = true
        return true
    }
}
