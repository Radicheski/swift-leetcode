//
//  LargestDivisibleSubset.swift
//  https://leetcode.com/problems/largest-divisible-subset/
//
//  Created by Erik Radicheski da Silva on 09/02/24.
//

import XCTest

final class LargestDivisibleSubset: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.largestDivisibleSubset([1, 2, 3]), [1, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.largestDivisibleSubset([1, 2, 4, 8]), [1, 2, 4, 8])
    }
    
}

private class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        let nums = nums.sorted()
        
        var groupSize = Array(repeating: 0, count: nums.count)
        var largestElement: [Int?] = Array(repeating: nil, count: nums.count)
        var maxIndex = 0
        
        for i in nums.indices {
            groupSize[i] = 1
            
            for j in 0 ..< i where nums[i] % nums[j] == 0 {
                if groupSize[i] <= groupSize[j] {
                    groupSize[i] = groupSize[j] + 1
                    largestElement[i] = j
                }
            }
            
            if groupSize[i] > groupSize[maxIndex] {
                maxIndex = i
            }
        }
        
        var answer = [Int]()
        
        while true {
            answer.append(nums[maxIndex])
            
            if let nextIndex = largestElement[maxIndex] {
                maxIndex = nextIndex
            } else {
                break
            }
        }
        
        return answer
    }
}
