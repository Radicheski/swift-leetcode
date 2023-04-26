//
//  AddDigits.swift
//  https://leetcode.com/problems/add-digits/
//
//  Created by Erik Radicheski da Silva on 26/04/23.
//

import XCTest

final class AddDigits: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.addDigits(38), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.addDigits(0), 0)
    }

}

private class Solution {
    func addDigits(_ num: Int) -> Int {
        var sum = 0
        var num = num
        
        while num > 0 {
            sum += num % 10
            num /= 10
        }
        
        return sum < 10 ? sum : addDigits(sum)
    }
}

