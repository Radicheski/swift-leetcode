//
//  UglyNumber2.swift
//  https://leetcode.com/problems/ugly-number-ii/
//
//  Created by Erik Radicheski da Silva on 09/12/22.
//

import XCTest

final class UglyNumber2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.nthUglyNumber(10), 12)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.nthUglyNumber(1), 1)
    }

}

private class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var numbers = [1]
        
        var base2 = 2
        var index2 = 0
        
        var base3 = 3
        var index3 = 0
        
        var base5 = 5
        var index5 = 0
        
        while numbers.count < n {
            let nextNumber = min(base2, base3, base5)
            
            numbers.append(nextNumber)
            
            if nextNumber == base2 {
                index2 += 1
                base2 = 2 * numbers[index2]
            }
            if nextNumber == base3 {
                index3 += 1
                base3 = 3 * numbers[index3]
            }
            if nextNumber == base5 {
                index5 += 1
                base5 = 5 * numbers[index5]
            }
        }
        
        return numbers.last ?? 1
    }
}
