//
//  Combinations.swift
//  https://leetcode.com/problems/combinations/
//
//  Created by Erik Radicheski da Silva on 24/09/22.
//

import XCTest

final class Combinations: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.combine(4, 2), [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.combine(1, 1), [[1]])
    }

}

private class Solution {
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        let numbers = Array(1 ... n)
        
        return combine(numbers, k)
    }
    
    func combine(_ array: [Int], _ k: Int) -> [[Int]] {
        guard k > 1 else {
            return array.reduce(into: [[Int]]()) { $0.append([$1]) }
        }
        
        var result = [[Int]]()

        for (index, number) in array.enumerated() {
            combine(Array(array[index + 1 ..< array.count]), k - 1)
                .forEach {
                    var newArray = [number]
                    newArray.append(contentsOf: $0)
                    result.append(newArray)
                }
        }
        
        return result
        
    }
    
}
