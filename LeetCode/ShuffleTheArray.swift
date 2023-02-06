//
//  ShuffleTheArray.swift
//  https://leetcode.com/problems/shuffle-the-array/
//
//  Created by Erik Radicheski da Silva on 06/02/23.
//

import XCTest

final class ShuffleTheArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.shuffle([2, 5, 1, 3, 4, 7], 3), [2, 3, 5, 4, 1, 7])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.shuffle([1, 2, 3, 4, 4, 3, 2, 1], 4), [1, 4, 2, 3, 3, 2, 4, 1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.shuffle([1, 1, 2, 2], 2), [1, 2, 1, 2])
    }

}

private class Solution {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var result = [Int]()
        
        for i in 0 ..< n {
            result.append(nums[i])
            result.append(nums[n + i])
        }
        
        return result
    }
}
