//
//  SortTheJumbledNumbers.swift
//  https://leetcode.com/problems/sort-the-jumbled-numbers/
//
//  Created by Erik Radicheski da Silva on 24/07/24.
//

import XCTest

final class SortTheJumbledNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sortJumbled([8, 9, 4, 0, 2, 1, 3, 5, 7, 6], [991, 338, 38]), [338, 38, 991])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sortJumbled([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [789, 456, 123]), [123, 456, 789])
    }
    
    func test() {
        XCTAssertEqual(solution.sortJumbled([9,8,7,6,5,4,3,2,1,0], [0,1,2,3,4,5,6,7,8,9]), [9,8,7,6,5,4,3,2,1,0])
    }
    
}

private class Solution {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        var queue = [(Int, Int)]()
        
        for num in nums {
            guard num != 0 else {
                queue.append((mapping[0], num))
                continue
            }
            
            var temp = num
            var mapped = 0
            var scale = 1
            
            while temp > 0 {
                mapped += scale * mapping[temp % 10]
                scale *= 10
                temp /= 10
            }
            
            queue.append((mapped, num))
        }
        
        return queue.sorted(by: { $0.0 < $1.0 }).map(\.1)
    }
}
