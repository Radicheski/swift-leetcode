//
//  RankTransformOfAnArray.swift
//  https://leetcode.com/problems/rank-transform-of-an-array/
//
//  Created by Erik Radicheski da Silva on 01/10/24.
//

import XCTest

final class RankTransformOfAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.arrayRankTransform([40, 10, 20, 30]), [4, 1, 2, 3])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.arrayRankTransform([100, 100, 100]), [1, 1, 1])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.arrayRankTransform([37, 12, 28, 9, 100, 56, 80, 5, 12]), [5, 3, 4, 2, 8, 6, 7, 1, 3])
    }
    
}

private class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var ranks = [Int: Int]()
        
        for num in Set(arr).sorted() {
            ranks[num] = ranks.count + 1
        }
        
        return arr.compactMap { ranks[$0] }
    }
}

