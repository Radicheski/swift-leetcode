//
//  ConvertAnArrayIntoA2DArrayWithConditions.swift
//  https://leetcode.com/problems/convert-an-array-into-a-2d-array-with-conditions/
//
//  Created by Erik Radicheski da Silva on 02/01/24.
//

import XCTest

final class ConvertAnArrayIntoA2DArrayWithConditions: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findMatrix([1, 3, 4, 1, 2, 3, 1]), [[1, 3, 4, 2], [1, 3], [1]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findMatrix([1, 2, 3, 4]), [[4, 3, 2, 1]])
    }
}

private class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        let count = Dictionary(nums.map { ($0, 1) }, uniquingKeysWith: +)
        
        var answer = [[Int]]()
        
        for (number, count) in count {
            if answer.indices.contains(count) == false  {
                answer.append(contentsOf: Array(repeating: [], count: count - answer.count))
            }
            
            for i in 0 ..< count {
                answer[i].append(number)
            }
        }
        
        return answer
    }
}
