//
//  FindAllDuplicatesInAnArray.swift
//  https://leetcode.com/problems/find-all-duplicates-in-an-array/
//
//  Created by Erik Radicheski da Silva on 25/03/24.
//

import XCTest

final class FindAllDuplicatesInAnArray: XCTestCase {
    
    private let solution =  Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]), [2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findDuplicates([1, 1, 2]), [1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findDuplicates([1]), [])
    }
    
}

private class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var answer = [Int]()
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(num) {
                answer.append(num)
            } else  {
                set.insert(num)
            }
        }
        
        return answer
    }
}
