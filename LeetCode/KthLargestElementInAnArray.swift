//
//  KthLargestElementInAnArray.swift
//  https://leetcode.com/problems/kth-largest-element-in-an-array/
//
//  Created by Erik Radicheski da Silva on 17/10/22.
//

import XCTest

final class KthLargestElementInAnArray: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findKthLargest([3, 2, 1, 5, 6, 4], 2), 5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4), 4)
    }

}

private class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var result = [Int]()
        
        nums[0 ..< k].forEach { result.append($0) }
        result.sort(by: >)
        
        nums[k...].forEach { number in
            if let last = result.last,
               last < number {
                if let index = result.firstIndex(where: { $0 < number } ) {
                    result.insert(number, at: index)
                    let _ = result.removeLast()
                }
            }
        }
        
        return result.last!
    }
}
