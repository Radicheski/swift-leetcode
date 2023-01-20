//
//  NonDecreasingSubsequences.swift
//  https://leetcode.com/problems/non-decreasing-subsequences/
//
//  Created by Erik Radicheski da Silva on 20/01/23.
//

import XCTest

final class NonDecreasingSubsequences: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = Set(solution.findSubsequences([4, 6, 7, 7]))
        let expectedOutput = Set([[4, 6], [4, 6, 7], [4, 6, 7, 7], [4, 7], [4, 7, 7], [6, 7], [6, 7, 7], [7, 7]])
        XCTAssertEqual(output, expectedOutput)
    }

    func testExampleB() {
        let output = Set(solution.findSubsequences([4, 4, 3, 2, 1]))
        let expectedOutput = Set([[4, 4]])
        XCTAssertEqual(output, expectedOutput)
    }

}

private class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        
        for i in 1 ..< (1 << nums.count) {
            let array = (0 ..< nums.count).filter { (i >> $0) & 1 == 1 }.map { nums[$0] }
            
            guard array.count > 1 else { continue }
            
            if isIncreasing(array) {
                result.insert(array)
            }
        }
        
        return Array(result)
    }
    
    private func isIncreasing(_ array: [Int]) -> Bool {
        var last = array[0]
        
        for i in 1 ..< array.endIndex {
            if array[i] < last { return false }
            
            last = array[i]
        }
        
        return true
    }
}
