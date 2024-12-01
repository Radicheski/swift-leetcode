//
//  CheckIfNAndItsDoubleExist.swift
//  https://leetcode.com/problems/check-if-n-and-its-double-exist/
//
//  Created by Erik Radicheski da Silva on 01/12/24.
//

import XCTest

final class CheckIfNAndItsDoubleExist: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.checkIfExist([10, 2, 5, 3]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.checkIfExist([3, 1, 7, 11]))
    }
    
}

private class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        let arr = arr.sorted(by: >)
        
        var doubles = Set<Int>()
        
        for num in arr {
            if doubles.contains(2 * num) { return true }
            if num.isMultiple(of: 2) && doubles.contains(num / 2) { return true }
            doubles.insert(num)
        }
        
        return false
    }
}
