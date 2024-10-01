//
//  CheckIfArrayPairsAreDivisibleByK.swift
//  https://leetcode.com/problems/check-if-array-pairs-are-divisible-by-k/
//
//  Created by Erik Radicheski da Silva on 01/10/24.
//

import XCTest

final class CheckIfArrayPairsAreDivisibleByK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canArrange([1, 2, 3, 4, 5, 10, 6, 7, 8, 9], 5))
    }
    
    func testExampleB() {
        XCTAssertTrue(solution.canArrange([1, 2, 3, 4, 5, 6], 7))
    }
    
    func testExampleC() {
        XCTAssertFalse(solution.canArrange([1, 2, 3, 4, 5, 6], 10))
    }
    
}

private class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        let count = Dictionary(arr.map { (($0 % k + k) % k, 1) }, uniquingKeysWith: +)
        
        for (num, c) in count {
            guard num != 0 else { return c % 2 == 0 }
            
            if c != count[k - num] {
                return false
            }
        }
        
        return true
    }
}
