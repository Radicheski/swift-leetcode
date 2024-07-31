//
//  FillingBookcaseShelves.swift
//  https://leetcode.com/problems/filling-bookcase-shelves/
//
//  Created by Erik Radicheski da Silva on 31/07/24.
//

import XCTest

final class FillingBookcaseShelves: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minHeightShelves([[1, 1], [2, 3], [2, 3], [1, 1], [1, 1], [1, 1], [1, 2]], 4), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minHeightShelves([[1, 3], [2, 4], [3, 2]], 6), 4)
    }
    
}

private class Solution {
    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        var memo: [[Int?]] = Array(repeating: Array(repeating: nil, count: shelfWidth + 1), count: books.count)
        return minHeightShelves(books, shelfWidth, &memo, 0, shelfWidth, 0);
    }

    private func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int, _ memo: inout [[Int?]],
                                  _ i: Int, _ remainingShelfWidth: Int, _ maxHeight: Int) -> Int {
        
        if let answer = memo[i][remainingShelfWidth] {
            return answer
        }
        
        let width = books[i][0]
        let height = books[i][1]
        
        let maxHeightUpdated = max(maxHeight, height)
        
        if i == books.count - 1 {
            if remainingShelfWidth >= width {
                return maxHeightUpdated
            } else {
                return maxHeight + height
            }
        }
        
        var newHeight = maxHeight + minHeightShelves(books, shelfWidth, &memo, i + 1, shelfWidth - width, height)
        
        if remainingShelfWidth >= width {
            newHeight = min(newHeight, minHeightShelves(books, shelfWidth, &memo, i + 1, remainingShelfWidth - width, maxHeightUpdated))
        }
        
        memo[i][remainingShelfWidth] = newHeight
        
        return newHeight
    }
}
