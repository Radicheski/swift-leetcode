//
//  Subsets.swift
//  https://leetcode.com/problems/subsets/
//
//  Created by Erik Radicheski da Silva on 27/10/22.
//

import XCTest

final class Subsets: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [1, 2, 3]
        let expectedOutput = Set([[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]])
        let output = Set(solution.subsets(input))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = [0]
        let expectedOutput = Set([[], [0]])
        let output = Set(solution.subsets(input))
        XCTAssertEqual(expectedOutput, output)
    }
    
}

private class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        var subset = SubSet(nums)
        
        while subset.hasNext {
            result.append(subset.next())
        }
        
        return result
    }
    
    private struct SubSet {
        private var position: UInt64 = 0
        private var set: [Int]
        
        init(_ nums: [Int]) {
            assert(nums.count <= position.bitWidth)
            set = nums
            position = 1 << nums.count
        }
        
        var hasNext: Bool {
            position > 0
        }
        
        mutating func next() -> [Int] {
            position -= 1
            let nextSet = String(position, radix: 2)
                .reversed()
                .enumerated()
                .filter { $0.element == "1" }
                .map { $0.offset }
                .reduce(into: []) { $0.append(set[$1]) }
            return nextSet
        }
    }
}
