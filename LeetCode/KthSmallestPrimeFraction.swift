//
//  KthSmallestPrimeFraction.swift
//  https://leetcode.com/problems/k-th-smallest-prime-fraction/
//
//  Created by Erik Radicheski da Silva on 10/05/24.
//

import XCTest

final class KthSmallestPrimeFraction: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kthSmallestPrimeFraction([1, 2, 3, 5], 3), [2, 5])
    }
    
    func testExmapleB() {
        XCTAssertEqual(solution.kthSmallestPrimeFraction([1, 7], 1), [1, 7])
    }
    
}

private class Solution {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var (left, right) = (0.0, 1.0)
        
        while left < right {
            let middle = (left + right) / 2
            
            var greatestFraction = 0.0
            var smallFractionCount = 0
            
            var index = (numerator: 0, denominator: 0)
            
            var j = 1
            
            for i in 0 ..< arr.endIndex - 1 {
                while (j < arr.endIndex && Double(arr[i]) >= middle * Double(arr[j])) {
                    j += 1
                }
                
                smallFractionCount += arr.count - j
                
                guard j < arr.endIndex else { break }
                
                let fraction = Double(arr[i]) / Double(arr[j])
                
                if fraction > greatestFraction {
                    index.numerator = i
                    index.denominator = j
                    greatestFraction = fraction
                }
            }
            
            if smallFractionCount == k { return [arr[index.numerator], arr[index.denominator]] }
            
            if smallFractionCount > k {
                right = middle
            } else {
                left = middle
            }
        }
        
        return []
    }
}
