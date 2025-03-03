//
//  ApplyOperationsToAnArray.swift
//  https://leetcode.com/problems/apply-operations-to-an-array/
//
//  Created by Erik Radicheski da Silva on 28/02/25.
//

import XCTest

final class ApplyOperationsToAnArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.applyOperations([1,2,2,1,1,0]), [1,4,2,0,0,0])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.applyOperations([0, 1]), [1, 0])
    }
}

private class Solution {
    func applyOperations(_ nums: [Int]) -> [Int] {
        var nums = nums
        
        for i in 0 ..< nums.endIndex - 1 {
            if nums[i] == nums[i + 1] {
                nums[i] *=  2
                nums[i + 1] = 0
            }
        }
        
        var answer = nums.filter { $0 != 0 }
        answer.append(contentsOf: Array(repeating: 0, count: nums.count - answer.count))
        
        return answer
    }
}
