//
//  ShuffleAnArray.swift
//  https://leetcode.com/problems/shuffle-an-array/
//
//  Created by Erik Radicheski da Silva on 07/11/22.
//

import XCTest

final class ShuffleAnArray: XCTestCase {

    //TODO: Test cases

}


private class Solution {
    
    private let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func reset() -> [Int] {
        nums
    }
    
    func shuffle() -> [Int] {
        var result = nums
        
        for i in 0 ..< result.endIndex {
            let newIndex = Int.random(in: i ..< result.endIndex)
            let tempNumber = result[newIndex]
            result[newIndex] = result[i]
            result[i] = tempNumber
        }
        
        return result
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
