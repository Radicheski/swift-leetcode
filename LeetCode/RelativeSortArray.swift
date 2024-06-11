//
//  RelativeSortArray.swift
//  https://leetcode.com/problems/relative-sort-array/
//
//  Created by Erik Radicheski da Silva on 11/06/24.
//

import XCTest

final class RelativeSortArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.relativeSortArray([2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19], [2, 1, 4, 3, 9, 6]), [2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.relativeSortArray([28, 6, 22, 8, 44, 17], [22, 28, 8, 6]), [22, 28, 8, 6, 17, 44])
    }
    
}

private class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var answer = arr1
        var count = [Int: Int]()
        
        for num in arr2 {
            count[num] = 0
        }
        
        var i = 0
        
        while i < answer.endIndex {
            let num = answer[i]
            
            if let frequency = count[num] {
                count[num] = frequency + 1
                answer.remove(at: i)
            } else {
                i += 1
            }
        }
        
        answer.sort()
        
        for num in arr2.reversed() {
            let frequency = count[num]!
            answer.insert(contentsOf: Array(repeating: num, count: frequency), at: 0)
        }
        
        return answer
    }
}
