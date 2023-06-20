//
//  KRadiusSubarrayAverages.swift
//  https://leetcode.com/problems/k-radius-subarray-averages/
//
//  Created by Erik Radicheski da Silva on 20/06/23.
//

import XCTest

final class KRadiusSubarrayAverages: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.getAverages([7, 4, 3, 9, 1, 8, 5, 2, 6], 3),
                       [-1, -1, -1, 5, 4, 4, -1, -1, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.getAverages([100000], 0), [100000])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.getAverages([8], 100000), [-1])
    }

}

private class Solution {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        var averages = Array(repeating: -1, count: nums.count)
        
        let count = 2 * k + 1
        
        var subarraySum = 0
        
        for i in nums.indices {
            let middle = i - k
            let start = middle - k
            
            subarraySum += nums[i]
            if nums.indices.contains(start - 1) {
                subarraySum -= nums[start - 1]
            }
            
            if nums.indices.contains(start) {
                averages[middle] = subarraySum / count
            }
            
        }
        
        return averages
    }
}
