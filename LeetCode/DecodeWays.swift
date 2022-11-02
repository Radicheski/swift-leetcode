//
//  DecodeWays.swift
//  https://leetcode.com/problems/decode-ways/
//
//  Created by Erik Radicheski da Silva on 02/11/22.
//

import XCTest

final class DecodeWays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numDecodings("12"), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numDecodings("226"), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numDecodings("06"), 0)
    }

}

private class Solution {
    
    func numDecodings(_ s: String) -> Int {
        let nums = s.map(String.init).compactMap(Int.init)
        return numDecodings(nums)
    }
    
    private func numDecodings(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else { return 1 }
        guard nums[0] > 0 else { return 0 }
        
        var result = Array(repeating: 0, count: nums.count + 1)
        
        result[0] = 1
        result[1] = 1
        
        guard nums.count >= 2 else { return result[1] }
        
        for i in 2 ... nums.count {
            if nums[i - 1] > 0 {
                result[i] = result[i - 1]
            }
            
            if nums[i - 2] == 1 || (nums[i - 2] == 2 && nums[i - 1] < 7) {
                result[i] += result[i - 2]
            }
        }
        
        return result.last ?? 0
    }
}
