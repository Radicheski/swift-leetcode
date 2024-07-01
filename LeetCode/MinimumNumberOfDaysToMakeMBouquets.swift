//
//  MinimumNumberOfDaysToMakeMBouquets.swift
//  https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/
//
//  Created by Erik Radicheski da Silva on 01/07/24.
//

import XCTest

final class MinimumNumberOfDaysToMakeMBouquets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDays([1, 10, 3, 10, 2], 3, 1), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDays([1, 10, 3, 10, 2], 3, 2), -1)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minDays([7, 7, 7, 7, 12, 7, 7], 2, 3), 12)
    }
    
}

private class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        var left = 0
        var right = bloomDay.max()!
        
        var minimumWait = -1
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            let bouquets = canMakeBouquet(bloomDay, middle, k)
            
            if bouquets < m {
                left = middle + 1
            } else {
                minimumWait = middle
                right = middle - 1
            }
        }
        
        return minimumWait
    }
    
    private func canMakeBouquet(_ bloomDay: [Int], _ day: Int, _ k: Int) -> Int {
        var bouquets = 0
        var counter = 0
        
        for bloom in bloomDay {
            if bloom <= day {
                counter += 1
            } else {
                counter = 0
            }
            
            if counter == k {
                bouquets += 1
                counter = 0
            }
        }
        
        return bouquets
    }
}
