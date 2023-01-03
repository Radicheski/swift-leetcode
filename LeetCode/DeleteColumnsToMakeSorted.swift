//
//  DeleteColumnsToMakeSorted.swift
//  https://leetcode.com/problems/delete-columns-to-make-sorted/
//
//  Created by Erik Radicheski da Silva on 03/01/23.
//

import XCTest

final class DeleteColumnsToMakeSorted: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minDeletionSize(["cba", "daf", "ghi"]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minDeletionSize(["a", "b"]), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minDeletionSize(["zyx", "wvu", "tsr"]), 3)
    }

}

private class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let strs = strs.map { Array($0) }
        
        var result = 0
        
        for i in 0 ..< strs[0].endIndex {
            if strs.map( { $0[i] } ) != strs.map( { $0[i] } ).sorted() {
                result += 1
            }
        }
        
        return result
    }
}
