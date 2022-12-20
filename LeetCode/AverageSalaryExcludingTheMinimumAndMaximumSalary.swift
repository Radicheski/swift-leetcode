//
//  AverageSalaryExcludingTheMinimumAndMaximumSalary.swift
//  https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/
//
//  Created by Erik Radicheski da Silva on 20/12/22.
//

import XCTest

final class AverageSalaryExcludingTheMinimumAndMaximumSalary: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.average([4000, 3000, 1000, 2000]), 2500)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.average([1000, 2000, 3000]), 2000)
    }

}

private class Solution {
    func average(_ salary: [Int]) -> Double {
        var minimum = Double.infinity
        var maximum = -Double.infinity
        
        var sum = 0.0
        
        for val in salary {
            let value = Double(val)
            sum += value
            minimum = min(minimum, value)
            maximum = max(maximum, value)
        }
        
        return (sum - maximum - minimum) / (Double(salary.count) - 2)
    }
}
