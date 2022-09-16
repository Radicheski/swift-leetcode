//
//  MoveZeroes.swift
//  https://leetcode.com/problems/move-zeroes/
//
//  Created by Erik Radicheski da Silva on 16/09/22.
//

import XCTest

final class MoveZeroes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        var input = [0, 1, 0, 3, 12]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, [1, 3, 12, 0, 0])
    }
    
    func testExampleB() {
        var input = [0]
        solution.moveZeroes(&input)
        XCTAssertEqual(input, [0])
    }

}

private class Solution {
    
    func moveZeroes(_ nums: inout [Int]) {
        let length = nums.count
        var zeroCount = 0
        var index = 0
        
        while index < length - zeroCount {
            if nums[index] == 0 {
                let num = nums.remove(at: index)
                nums.append(num)
                zeroCount += 1
                continue
            }
            index += 1
        }
    }
    
}
