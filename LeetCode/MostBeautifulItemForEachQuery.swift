//
//  MostBeautifulItemForEachQuery.swift
//  https://leetcode.com/problems/most-beautiful-item-for-each-query/
//
//  Created by Erik Radicheski da Silva on 12/11/24.
//

import XCTest

final class MostBeautifulItemForEachQuery: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maximumBeauty([[1, 2], [3, 2], [2, 4], [5, 6], [3, 5]], [1, 2, 3, 4, 5, 6]), [2, 4, 5, 5, 6, 6])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maximumBeauty([[1, 2], [1, 2], [1, 3], [1, 4]], [1]), [4])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.maximumBeauty([[10, 1000]], [5]), [0])
    }
    
}

private class Solution {
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        var items = items.sorted { $0[0] < $1[0] }
        var mostBeauty = items[0][1]
        
        for i in items.indices {
            mostBeauty = max(mostBeauty, items[i][1])
            items[i][1] = mostBeauty
        }
        
        return queries.map { search($0, items) }
    }
    
    private func search(_ price: Int, _ items: [[Int]]) -> Int {
        var left = 0
        var right = items.endIndex - 1
        
        var mostBeauty = 0
        
        while left <= right {
            let middle = left + (right - left) / 2
            
            if items[middle][0] > price {
                right = middle - 1
            } else {
                mostBeauty = max(mostBeauty, items[middle][1])
                left = middle + 1
            }
        }
        
        return mostBeauty
    }
}
