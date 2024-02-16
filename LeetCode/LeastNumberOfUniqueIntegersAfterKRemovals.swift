//
//  LeastNumberOfUniqueIntegersAfterKRemovals.swift
//  https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/
//
//  Created by Erik Radicheski da Silva on 16/02/24.
//

import XCTest

final class LeastNumberOfUniqueIntegersAfterKRemovals: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findLeastNumOfUniqueInts([5, 5, 4], 1), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findLeastNumOfUniqueInts([4, 3, 1, 1, 3, 3, 2], 3), 2)
    }
    
}

private class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        guard k < arr.count else { return 0 }
        
        var arr = Dictionary(arr.map { ($0, 1) }, uniquingKeysWith: +).map(\.value).sorted(by: >)
        var k = k
        
        while k > 0 {
            guard k >= arr.last! else { return arr.count }
            
            k -= arr.removeLast()
        }
        
        return arr.count
    }
}
