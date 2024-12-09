//
//  SpecialArray2.swift
//  https://leetcode.com/problems/special-array-ii/
//
//  Created by Erik Radicheski da Silva on 09/12/24.
//

import XCTest

final class SpecialArray2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.isArraySpecial([3, 4, 1, 2, 6], [[0, 4]]), [false])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.isArraySpecial([4, 3, 1, 6], [[0, 2], [2, 3]]), [false, true])
    }
    
}

private class Solution {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        var special = [[Int]]()
        
        var start = 0
        var end = 0
        
        for i in 1 ..< nums.endIndex {
            if nums[i - 1].isMultiple(of: 2) == nums[i].isMultiple(of: 2) {
                special.append([start, end])
                start = i
                end = i
            } else {
                end += 1
            }
        }
        
        special.append([start, end])
        
        var answer = [Bool]()
        
        for query in queries {
            if query[0] == query[1] {
                answer.append(true)
            } else {
                start = 0
                end = special.endIndex - 1
                
                while start < end {
                    let middle = start + (end - start) / 2
                    
                    if special[middle][1] < query[0] {
                        start = middle + 1
                    } else {
                        end = middle
                    }
                }
                
                answer.append(query[1] <= special[start][1])
            }
        }
        
        return answer
    }
}
