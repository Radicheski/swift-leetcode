//
//  MinimumIndexOfAValidSplit.swift
//  https://leetcode.com/problems/minimum-index-of-a-valid-split/
//
//  Created by Erik Radicheski da Silva on 27/03/25.
//

import XCTest

final class MinimumIndexOfAValidSplit: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minimumIndex([1, 2, 2, 2]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minimumIndex([2, 1, 3, 1, 1, 1, 7, 1, 2, 1]), 4)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minimumIndex([3, 3, 3, 3, 7, 2, 2]), -1)
    }
    
}

private class Solution {
    func minimumIndex(_ nums: [Int]) -> Int {
        let count = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
        let (dominantElement, dominantCount) = count.max(by: { $0.value < $1.value })!
        
        var leftCount = 0
        
        for i in nums.indices {
            if nums[i] == dominantElement {
                leftCount += 1
            }
            
            if leftCount > (i + 1) / 2 && dominantCount - leftCount > (nums.count - i - 1) / 2 {
                return i
            }
        }
        
        return -1
    }
}
