//
//  PartitionLabels.swift
//  https://leetcode.com/problems/partition-labels/
//
//  Created by Erik Radicheski da Silva on 04/10/22.
//

import XCTest

final class PartitionLabels: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.partitionLabels("ababcbacadefegdehijhklij"), [9, 7, 8])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.partitionLabels("eccbbbbdec"), [10])
    }

}

private class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let charArray = s.map(String.init)
        
        var j = 0
        var anchor = 0
        var result = [Int]()
        
        for (i, char) in charArray.enumerated() {
            j = max(j, charArray.lastIndex(of: char)!)
            if i == j {
                result.append(i - anchor + 1)
                anchor = i + 1
            }
        }
        
        return result
    }
}
