//
//  ClosestPrimeNumbersInRange.swift
//  https://leetcode.com/problems/closest-prime-numbers-in-range/
//
//  Created by Erik Radicheski da Silva on 07/03/25.
//

import XCTest

final class ClosestPrimeNumbersInRange: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.closestPrimes(10, 19), [11, 13])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.closestPrimes(4, 6), [-1, -1])
    }
    
}

private class Solution {
    func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
        var isPrime = Array(repeating: true, count: right + 1)
        
        isPrime[0] = false
        isPrime[1] = false
        
        for number in isPrime.indices {
            guard isPrime[number] == true else { continue }
            
            var multiple = 2 * number
            
            while isPrime.indices.contains(multiple) {
                isPrime[multiple] = false
                multiple += number
            }
        }
        
        let primes = isPrime.enumerated().filter( { $0.element && (left ... right).contains($0.offset) } ).map(\.offset)
        
        guard primes.count > 1 else { return [-1, -1] }
        
        var answer = [0, Int.max]
        
        for i in (1 ..< primes.endIndex).reversed() {
            if primes[i] - primes[i - 1] <= answer[1] - answer[0] {
                answer[1] = primes[i]
                answer[0] = primes[i - 1]
            }
        }
        
        return answer
    }
}
