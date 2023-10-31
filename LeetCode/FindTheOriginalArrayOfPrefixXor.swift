//
//  FindTheOriginalArrayOfPrefixXor.swift
//  https://leetcode.com/problems/find-the-original-array-of-prefix-xor/
//
//  Created by Erik Radicheski da Silva on 31/10/23.
//

import XCTest

final class FindTheOriginalArrayOfPrefixXor: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findArray([5, 2, 0, 3, 1]), [5, 7, 2, 3, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findArray([13]), [13])
    }
    
}

private class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var answer = Array(repeating: 0, count: pref.count)
        
        answer[0] = pref[0]
        
        for i in pref.indices.dropFirst() {
            answer[i] = pref[i] ^ pref[i - 1]
        }
        
        return answer
    }
}
