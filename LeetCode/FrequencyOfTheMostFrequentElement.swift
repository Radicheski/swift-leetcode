//
//  FrequencyOfTheMostFrequentElement.swift
//  https://leetcode.com/problems/frequency-of-the-most-frequent-element/
//
//  Created by Erik Radicheski da Silva on 18/11/23.
//

import XCTest

final class FrequencyOfTheMostFrequentElement: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxFrequency([1, 2, 4], 5), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxFrequency([1, 4, 8, 13], 5), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maxFrequency([3, 9, 6], 2), 1)
    }

}

private class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var answer = 0
        var windowSum = 0
        var left = 0
        
        for (right, target) in nums.enumerated() {
            windowSum += target
            
            while (right - left + 1) * target - windowSum > k {
                windowSum -= nums[left]
                left += 1
            }
            
            answer = max(answer, right - left + 1)
        }
        
        return answer
    }
}
