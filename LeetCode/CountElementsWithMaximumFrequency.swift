//
//  CountElementsWithMaximumFrequency.swift
//  https://leetcode.com/problems/count-elements-with-maximum-frequency/
//
//  Created by Erik Radicheski da Silva on 08/03/24.
//

import XCTest

final class CountElementsWithMaximumFrequency: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxFrequencyElements([1, 2, 2, 3, 1, 4]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxFrequencyElements([1, 2, 3, 4, 5]), 5)
    }
    
}

private class Solution {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        var elementCount = [Int: Int]()
        var frequencyCount = [Int: Int]()
        var maxFrequency = 0
        
        for num in nums {
            let count = elementCount[num, default: 0]
            
            elementCount[num] = count + 1
            
            frequencyCount[count, default: 0] -= 1
            frequencyCount[count + 1, default: 0] += 1
            
            maxFrequency = max(maxFrequency, count + 1)
        }
        
        return maxFrequency * frequencyCount[maxFrequency]!
    }
}
