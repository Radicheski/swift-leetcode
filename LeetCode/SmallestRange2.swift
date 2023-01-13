//
//  SmallestRange2.swift
//  https://leetcode.com/problems/smallest-range-ii/
//
//  Created by Erik Radicheski da Silva on 13/01/23.
//

import XCTest

final class SmallestRange2: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.smallestRangeII([1], 0), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.smallestRangeII([0, 10], 2), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.smallestRangeII([1, 3, 6], 3), 3)
    }
    
}

private class Solution {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        
        guard let first = nums.first, let last = nums.last else { return 0}
        
        var result = last - first
        
        for i in 0 ..< nums.endIndex - 1 {
            let (a, b) = (nums[i], nums[i + 1])
            
            let high = max(last - k, a + k)
            let low = min(first + k, b - k)
            
            result = min(result, high - low)
        }
        
        return result
    }
}
