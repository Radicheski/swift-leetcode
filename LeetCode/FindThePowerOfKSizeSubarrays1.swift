//
//  FindThePowerOfKSizeSubarrays1.swift
//  https://leetcode.com/problems/find-the-power-of-k-size-subarrays-i/
//
//  Created by Erik Radicheski da Silva on 16/11/24.
//

import XCTest

final class FindThePowerOfKSizeSubarrays1: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.resultsArray([1, 2, 3, 4, 3, 2, 5], 3), [3, 4, -1, -1, -1])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.resultsArray([2, 2, 2, 2, 2], 4), [-1, -1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.resultsArray([3, 2, 3, 2, 3, 2], 2), [-1, 3, -1, 3, -1])
    }
    
}

private class Solution {
    func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
        var window = [Int]()
        var answer = [Int]()
        
        for num in nums {
            window.append(num)
            
            if window.count < k { continue }
            
            while window.count > k {
                let _ = window.removeFirst()
            }
            
            var append: Int?
            
            for i in 0 ..< k - 1 {
                if window[i] + 1 != window[i + 1] {
                    append = -1
                    break
                }
            }
            
            answer.append(append ?? num)
        }
        
        return answer
    }
}
