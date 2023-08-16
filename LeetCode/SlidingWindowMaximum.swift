//
//  SlidingWindowMaximum.swift
//  https://leetcode.com/problems/sliding-window-maximum/
//
//  Created by Erik Radicheski da Silva on 16/08/23.
//

import XCTest

final class SlidingWindowMaximum: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3), [3, 3, 5, 5, 6, 7])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxSlidingWindow([1], 1), [1])
    }

}

private class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var maximumIndexes = [Int]()
        var answer = [Int]()
        
        for i in 0 ..< k {
            while maximumIndexes.isEmpty == false && nums[i] > nums[maximumIndexes.last!] {
                let _ = maximumIndexes.removeLast()
            }
            
            maximumIndexes.append(i)
        }
        answer.append(nums[maximumIndexes.first!])
        
        for i in k ..< nums.endIndex {
            if maximumIndexes[0] == i - k {
                let _ = maximumIndexes.removeFirst()
            }
            
            while maximumIndexes.isEmpty == false && nums[i] > nums[maximumIndexes.last!] {
                let _ = maximumIndexes.removeLast()
            }
            
            maximumIndexes.append(i)
            answer.append(nums[maximumIndexes.first!])
        }
        
        return answer
    }
}
