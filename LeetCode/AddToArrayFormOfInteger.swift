//
//  AddToArrayFormOfInteger.swift
//  https://leetcode.com/problems/add-to-array-form-of-integer/
//
//  Created by Erik Radicheski da Silva on 05/01/23.
//

import XCTest

final class AddToArrayFormOfInteger: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.addToArrayForm([1, 2, 0, 0], 34), [1, 2, 3, 4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.addToArrayForm([2, 7, 4], 181), [4, 5, 5])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.addToArrayForm([2, 1, 5], 806), [1, 0, 2, 1])
    }

}

private class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var num = num
        
        var index = num.endIndex - 1
        
        num[index] += k
        
        while num.allSatisfy( { $0 < 10 } ) == false {
            let carry = num[index] / 10
            num[index] %= 10
            
            if index == 0 {
                num.insert(carry, at: 0)
            } else {
                num[index - 1] += carry
            }
            
            index = max(0, index - 1)
        }
        
        return num
    }
}
