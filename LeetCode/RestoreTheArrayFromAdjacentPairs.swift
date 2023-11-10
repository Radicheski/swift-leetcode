//
//  RestoreTheArrayFromAdjacentPairs.swift
//  https://leetcode.com/problems/restore-the-array-from-adjacent-pairs/
//
//  Created by Erik Radicheski da Silva on 10/11/23.
//

import XCTest

final class RestoreTheArrayFromAdjacentPairs: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.restoreArray([[2, 1], [3, 4], [3, 2]]), [1, 2, 3, 4])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.restoreArray([[4, -2], [1, 4], [-3, 1]]), [-2, 4, 1, -3])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.restoreArray([[100000, -100000]]), [100000, -100000])
    }

}

private class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var indices = [Int: [Int]]()
        
        for pair in adjacentPairs {
            indices[pair[0], default: []].append(pair[1])
            indices[pair[1], default: []].append(pair[0])
        }
        
        var array = [Int]()
        
        for (num, next) in indices where next.count == 1 {
            array.append(num)
            array.append(contentsOf: next)
            break
        }
        
        while array.count < indices.count {
            let last = array[array.endIndex - 1]
            let previous = array[array.endIndex - 2]
            
            for next in indices[last] ?? [] where next != previous {
                array.append(next)
            }
        }
        
        return array
    }
}
