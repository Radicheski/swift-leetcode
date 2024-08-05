//
//  KthDistinctStringInAnArray.swift
//  https://leetcode.com/problems/kth-distinct-string-in-an-array/
//
//  Created by Erik Radicheski da Silva on 05/08/24.
//

import XCTest

final class KthDistinctStringInAnArray: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.kthDistinct(["d", "b", "c", "b", "c", "a"], 2), "a")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.kthDistinct(["aaa", "aa", "a"], 1), "aaa")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.kthDistinct(["a", "b", "a"], 3), "")
    }
    
}

private class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var index = [String: Int]()
        
        for (i, string) in arr.enumerated() {
            if let _ = index[string] {
                index[string] = -1
            } else {
                index[string] = i
            }
        }
        
        let order = index.filter { $0.value != -1 }.sorted { $0.value < $1.value }.map(\.key)
        
        return k <= order.endIndex ? order[k - 1] : ""
    }
}
