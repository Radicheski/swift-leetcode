//
//  MakeLexicographicallySmallestArrayBySwappingElements.swift
//  https://leetcode.com/problems/make-lexicographically-smallest-array-by-swapping-elements/
//
//  Created by Erik Radicheski da Silva on 25/01/25.
//

import XCTest

final class MakeLexicographicallySmallestArrayBySwappingElements: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.lexicographicallySmallestArray([1, 5, 3, 9, 8], 2), [1, 3, 5, 8, 9])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.lexicographicallySmallestArray([1, 7, 6, 18, 2, 1], 3), [1, 6, 7, 18, 1, 2])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.lexicographicallySmallestArray([1, 7, 28, 19, 10], 3), [1, 7, 28, 19, 10])
    }
    
}

private class Solution {
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        let sortedNums = nums.enumerated().sorted { $0.element < $1.element }
        
        var groups = [[(i: Int, num: Int)]]()
        
        for (i, num) in sortedNums {
            if groups.isEmpty {
                groups.append([(i, num)])
            } else {
                let lastGroup = groups.endIndex - 1
                
                if let lastNum = groups[lastGroup].last?.num, abs(lastNum - num) <= limit {
                    groups[lastGroup].append((i, num))
                } else {
                    groups.append([(i, num)])
                }
            }
        }
        
        var answer = Array(repeating: 0, count: nums.count)
        
        for group in groups {
            let indices = group.map(\.i).sorted()
            let nums = group.map(\.num).sorted()
            
            for i in group.indices {
                answer[indices[i]] = nums[i]
            }
        }
        
        return answer
    }
}
