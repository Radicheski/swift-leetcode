//
//  MaximumSumOfDistinctSubarraysWithLengthK.swift
//  https://leetcode.com/problems/maximum-sum-of-distinct-subarrays-with-length-k/
//
//  Created by Erik Radicheski da Silva on 19/11/24.
//

import XCTest

final class MaximumSumOfDistinctSubarraysWithLengthK: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumSubarraySum([1, 5, 4, 2, 9, 9, 9], 3), 15)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumSubarraySum([4, 4, 4], 3), 0)
    }
    
}

private class Solution {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var subarray = [Int]()
        var count = [Int: Int]()
        var unique = Set<Int>()
        var maximumSum = 0
        var sum = 0
        
        for num in nums {
            sum += num
            
            subarray.append(num)
            
            if let numCount = count[num] {
                unique.remove(num)
                count[num] = numCount + 1
            } else {
                count[num] = 1
                unique.insert(num)
            }
            
            while subarray.count > k {
                let first = subarray.removeFirst()
                
                sum -= first
                
                if let firstCount = count[first] {
                    if firstCount == 1 {
                        count[first] = nil
                        unique.remove(first)
                    } else if firstCount == 2 {
                        unique.insert(first)
                        count[first] = firstCount - 1
                    } else {
                        count[first] = firstCount - 1
                    }
                }
            }
            
            if subarray.count == k && count.count == unique.count {
                maximumSum = max(maximumSum, sum)
            }
            
        }
        
        
        return maximumSum
    }
}
