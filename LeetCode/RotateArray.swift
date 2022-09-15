//
//  RotateArray.swift
//  https://leetcode.com/problems/rotate-array/
//
//  Created by Erik Radicheski da Silva on 15/09/22.
//

import XCTest

final class RotateArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        var input = [1, 2, 3, 4, 5, 6, 7]
        solution.rotate(&input, 3)
        XCTAssertEqual(input, [5, 6, 7, 1, 2, 3, 4])
    }
    
    func testExampleB() {
        var input = [-1, -100, 3, 99]
        solution.rotate(&input, 2)
        XCTAssertEqual(input, [3, 99, -1, -100])
    }

}

private class Solution {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        for _ in 0 ..< k {
            let num = nums.removeLast()
            nums.insert(num, at: 0)
        }
    }
    
}
