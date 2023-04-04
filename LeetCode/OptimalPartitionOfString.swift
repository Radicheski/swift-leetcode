//
//  OptimalPartitionOfString.swift
//  https://leetcode.com/problems/optimal-partition-of-string/
//
//  Created by Erik Radicheski da Silva on 04/04/23.
//

import XCTest

final class OptimalPartitionOfString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.partitionString("abacaba"), 4)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.partitionString("ssssss"), 6)
    }

}

private class Solution {
    func partitionString(_ s: String) -> Int {
        var letters = Set<Character>()
        var count = 1
        
        for letter in s {
            if letters.contains(letter) {
                count += 1
                letters = Set([letter])
            } else {
                letters.insert(letter)
            }
        }
        return count
    }
}
