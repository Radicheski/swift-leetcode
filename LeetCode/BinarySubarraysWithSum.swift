//
//  BinarySubarraysWithSum.swift
//  https://leetcode.com/problems/binary-subarrays-with-sum/description/?envType=daily-question&envId=2024-03-14
//
//  Created by Erik Radicheski da Silva on 14/03/24.
//

import XCTest

final class BinarySubarraysWithSum: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSubarraysWithSum([1, 0, 1, 0, 1], 2), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSubarraysWithSum([0, 0, 0, 0, 0], 0), 15)
    }
    
}

private class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var count = 0
        var sum = 0
        var frequency = [Int: Int]()
        
        for num in nums {
            sum += num
            
            if sum == goal { count += 1 }
            
            if let frequency = frequency[sum - goal] {
                count += frequency
            }
            
            frequency[sum, default: 0] += 1
        }
        
        return count
    }
}
