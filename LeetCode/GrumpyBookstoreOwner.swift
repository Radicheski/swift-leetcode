//
//  GrumpyBookstoreOwner.swift
//  https://leetcode.com/problems/grumpy-bookstore-owner/
//
//  Created by Erik Radicheski da Silva on 21/06/24.
//

import XCTest

final class GrumpyBookstoreOwner: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSatisfied([1, 0, 1, 2, 1, 1, 7, 5], [0, 1, 0, 1, 0, 1, 0, 1], 3), 16)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSatisfied([1], [0], 1), 1)
    }
    
}

private class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
        var count = 0
        
        for i in customers.indices where grumpy[i] == 0 {
            count += customers[i]
        }
        
        var answer = count
        
        for i in customers.indices {
            if grumpy[i] == 1 { count += customers[i] }
            if i >= minutes && grumpy[i - minutes] == 1 {
                count -= customers[i - minutes]
            }
            
            answer = max(answer, count)
        }
        
        return answer
    }
}
