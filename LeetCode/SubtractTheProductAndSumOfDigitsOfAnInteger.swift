//
//  SubtractTheProductAndSumOfDigitsOfAnInteger.swift
//  https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/
//
//  Created by Erik Radicheski da Silva on 21/12/22.
//

import XCTest

final class SubtractTheProductAndSumOfDigitsOfAnInteger: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.subtractProductAndSum(234), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.subtractProductAndSum(4421), 21)
    }
    
}

private class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        var number = n
        
        var product = 1
        var sum = 0
        
        while number > 0 {
            let numeral = number % 10
            
            product *= numeral
            sum += numeral
            
            number /= 10
        }
        
        return product - sum
    }
}
