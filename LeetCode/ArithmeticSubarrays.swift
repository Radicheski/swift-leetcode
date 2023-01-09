//
//  ArithmeticSubarrays.swift
//  https://leetcode.com/problems/arithmetic-subarrays/
//
//  Created by Erik Radicheski da Silva on 09/01/23.
//

import XCTest

final class ArithmeticSubarrays: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.checkArithmeticSubarrays([4, 6, 5, 9, 3, 7], [0, 0, 2], [2, 3, 5]),
                       [true, false, true])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.checkArithmeticSubarrays([-12, -9, -3, -12, -6, 15, 20, -25, -20, -15, -10],
                                                         [0, 1, 6, 4, 8, 7], [4, 4, 9, 7, 9, 10]),
                       [false, true, false, false, true, true])
    }

}

private class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var result = Array(repeating: true, count: l.count)
        
        for i in 0 ..< l.endIndex {
            guard l[i] + 1 < r[i] else {
                continue
            }
            
            let subarray = nums[l[i] ... r[i]].sorted()
            
            let difference = subarray[1] - subarray[0]
            
            for j in 2 ..< subarray.endIndex {
                guard difference == subarray[j] - subarray[j - 1] else {
                    result[i] = false
                    break
                }
            }
        }
        
        return result
    }
}
