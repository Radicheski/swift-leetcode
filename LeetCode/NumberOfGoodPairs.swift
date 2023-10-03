//
//  NumberOfGoodPairs.swift
//  https://leetcode.com/problems/number-of-good-pairs/
//
//  Created by Erik Radicheski da Silva on 02/10/23.
//

import XCTest

final class NumberOfGoodPairs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numIdenticalPairs([1, 2, 3, 1, 1, 3]), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numIdenticalPairs([1, 1, 1, 1]), 6)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numIdenticalPairs([1, 2, 3]), 0)
    }
    

}

private class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        
        var answer = 0
        
        for num in nums {
            answer += dict[num] ?? 0
            dict[num, default: 0] += 1
        }
        
        return answer
    }
}
