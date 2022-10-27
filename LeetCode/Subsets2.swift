//
//  Subsets2.swift
//  https://leetcode.com/problems/subsets-ii/
//
//  Created by Erik Radicheski da Silva on 27/10/22.
//

import XCTest

final class Subsets2: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let input = [1,2,2]
        let expectedOutput = Set([[],[1],[1,2],[1,2,2],[2],[2,2]])
        let output = Set(solution.subsetsWithDup(input))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func testExampleB() {
        let input = [0]
        let expectedOutput = Set([[], [0]])
        let output = Set(solution.subsetsWithDup(input))
        XCTAssertEqual(expectedOutput, output)
    }
    
    func test() {
    }
}

private class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        
        var subset = SubSet(nums)
        
        while subset.hasNext {
            result.insert(subset.next().sorted())
        }
        
        return Array(result)
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
