//
//  FindThePrefixCommonArrayOfTwoArrays.swift
//  https://leetcode.com/problems/find-the-prefix-common-array-of-two-arrays/
//
//  Created by Erik Radicheski da Silva on 14/01/25.
//

import XCTest

final class FindThePrefixCommonArrayOfTwoArrays: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findThePrefixCommonArray([1, 3, 2, 4], [3, 1, 2, 4]), [0, 2, 3, 4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findThePrefixCommonArray([2, 3, 1], [3, 1, 2]), [0, 1, 3])
    }
}

private class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var bitA = 0
        var bitB = 0
        
        var answer = [Int]()
        
        for i in A.indices {
            bitA |= (1 << A[i])
            bitB |= (1 << B[i])
            
            answer.append((bitA & bitB).nonzeroBitCount)
        }
        
        return answer
    }
}
