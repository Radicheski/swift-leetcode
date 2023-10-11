//
//  NumberOfFlowersInFullBloom.swift
//  https://leetcode.com/problems/number-of-flowers-in-full-bloom/
//
//  Created by Erik Radicheski da Silva on 11/10/23.
//

import XCTest

final class NumberOfFlowersInFullBloom: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.fullBloomFlowers([[1, 6], [3, 7], [9, 12], [4, 13]], [2, 3, 7, 11]), [1, 2, 2, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.fullBloomFlowers([[1, 10], [3, 3]], [3, 3, 2]), [2, 2, 1])
    }

}

private class Solution {
    func fullBloomFlowers(_ flowers: [[Int]], _ people: [Int]) -> [Int] {
        let difference = flowers.reduce(into: [0: 0], { difference, range in
            difference[range[0], default: 0] += 1
            difference[range[1] + 1, default: 0] -= 1
        }).map { (position: $0.key, difference: $0.value) }.sorted { $0.position < $1.position }
        
        var positions = [Int]()
        var prefix = [Int]()
        
        var count = 0
        
        for (position, diff) in difference {
            positions.append(position)
            count += diff
            prefix.append(count)
        }
        
        return people.map { binarySearch($0, positions) - 1 }.map { prefix[$0] }
    }
    
    private func binarySearch(_ target: Int, _ array: [Int]) -> Int {
        var left = 0
        var right = array.endIndex
        
        while left < right {
            let middle = left + (right - left) / 2
            if target < array[middle] {
                right = middle
            } else {
                left = middle + 1
            }
        }
        
        return left
    }
    
}
