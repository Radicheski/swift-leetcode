//
//  AlternatingGroupsII.swift
//  https://leetcode.com/problems/alternating-groups-ii/
//
//  Created by Erik Radicheski da Silva on 09/03/25.
//

import XCTest

final class AlternatingGroupsII: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numberOfAlternatingGroups([0, 1, 0, 1, 0], 3), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numberOfAlternatingGroups([0, 1, 0, 0, 1, 0, 1], 6), 2)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.numberOfAlternatingGroups([1, 1, 0, 1], 4), 0)
    }
    
}

private class Solution {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        let colors = colors + colors.prefix(upTo: k - 1)
        
        var left = 0
        var right = 1
        var count = 0
        
        while right < colors.endIndex {
            if colors[right] == colors[right - 1] {
                left = right
                right += 1
            } else {
                right += 1
                
                guard right - left == k else { continue }
                
                count += 1
                left += 1
            }
        }
        
        return count
    }
}
