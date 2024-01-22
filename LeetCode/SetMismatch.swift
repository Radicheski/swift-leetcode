//
//  SetMismatch.swift
//  https://leetcode.com/problems/set-mismatch/
//
//  Created by Erik Radicheski da Silva on 22/01/24.
//

import XCTest

final class SetMismatch: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findErrorNums([1, 2, 2, 4]), [2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findErrorNums([1, 1]), [1, 2])
    }
    
}

private class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var set = Set(1 ... nums.count)
        
        var answer = [Int]()
        
        for num in nums {
            if set.contains(num) {
                set.remove(num)
            } else {
                answer.append(num)
            }
        }
        
        guard set.count == 1 else { fatalError() }
        
        let missing = set.removeFirst()
        answer.append(missing)
        
        return answer
    }
}
