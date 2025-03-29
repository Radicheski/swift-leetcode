//
//  ApplyOperationsToMaximizeScore.swift
//  https://leetcode.com/problems/apply-operations-to-maximize-score/
//
//  Created by Erik Radicheski da Silva on 29/03/25.
//

import XCTest

final class ApplyOperationsToMaximizeScore: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumScore([8, 3, 9, 3, 8], 2), 81)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumScore([19, 12, 14, 6, 10, 18], 3), 4788)
    }
    
}

private class Solution {
    
    private let MOD = 1_000_000_007

    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var primeScores = [Int](repeating: 0, count: n)
        
        // Find the maximum element in nums to determine the range for prime generation
        let maxElement = nums.max() ?? 0
        
        // Get all prime numbers up to maxElement using the Sieve of Eratosthenes
        let primes = getPrimes(limit: maxElement)

        // Calculate the prime score for each number in nums
        for index in 0..<n {
            var num = nums[index]
            
            // Iterate over the generated primes to count unique prime factors
            for prime in primes {
                if prime * prime > num { break } // Stop early if prime^2 exceeds num
                if num % prime != 0 { continue } // Skip if the prime is not a factor
                
                primeScores[index] += 1 // Increment prime score for the factor
                while num % prime == 0 { num /= prime } // Remove all occurrences of this factor
            }
            
            // If num is still greater than 1, it is a prime number itself
            if num > 1 { primeScores[index] += 1 }
        }

        // Initialize next and previous dominant index arrays
        var nextDominant = [Int](repeating: n, count: n)
        var prevDominant = [Int](repeating: -1, count: n)

        // Stack to store indices for a monotonic decreasing prime score
        var decreasingPrimeScoreStack = [Int]()

        // Calculate the next and previous dominant indices for each number
        for index in 0..<n {
            while let last = decreasingPrimeScoreStack.last, primeScores[last] < primeScores[index] {
                let topIndex = decreasingPrimeScoreStack.removeLast()
                nextDominant[topIndex] = index
            }
            
            if let last = decreasingPrimeScoreStack.last {
                prevDominant[index] = last
            }

            decreasingPrimeScoreStack.append(index)
        }

        // Calculate the number of subarrays in which each element is dominant
        var numOfSubarrays = [Int](repeating: 0, count: n)
        for index in 0..<n {
            numOfSubarrays[index] = (nextDominant[index] - index) * (index - prevDominant[index])
        }

        // Sort elements in decreasing order based on their values
        var sortedArray = nums.enumerated().map { ($0.element, $0.offset) }
        sortedArray.sort { $0.0 > $1.0 } // Sort in descending order

        var score: Int64 = 1
        var k = k
        var processingIndex = 0

        // Process elements while there are operations left
        while k > 0 {
            let (num, index) = sortedArray[processingIndex]
            processingIndex += 1

            // Calculate the number of operations to apply on the current element
            let operations = min(k, numOfSubarrays[index])

            // Update the score by raising the element to the power of operations
            score = (score * power(num: Int64(num), exponent: Int64(operations))) % Int64(MOD)

            // Reduce the remaining operations count
            k -= operations
        }

        return Int(score)
    }

    // Helper function to compute the power of a number modulo MOD
    private func power(num: Int64, exponent: Int64) -> Int64 {
        var base = num
        var exp = exponent
        var result: Int64 = 1

        while exp > 0 {
            if exp % 2 == 1 {
                result = (result * base) % Int64(MOD)
            }
            base = (base * base) % Int64(MOD)
            exp /= 2
        }

        return result
    }

    // Function to generate prime numbers up to a given limit using the Sieve of Eratosthenes
    private func getPrimes(limit: Int) -> [Int] {
        guard limit >= 2 else { return [] }
        
        var isPrime = [Bool](repeating: true, count: limit + 1)
        var primes = [Int]()

        for number in 2...limit {
            if !isPrime[number] { continue }
            primes.append(number)

            var multiple = number * number
            while multiple <= limit {
                isPrime[multiple] = false
                multiple += number
            }
        }

        return primes
    }
}

