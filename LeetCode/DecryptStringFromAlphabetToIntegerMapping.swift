//
//  DecryptStringFromAlphabetToIntegerMapping.swift
//  https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping/
//
//  Created by Erik Radicheski da Silva on 28/12/22.
//

import XCTest

final class DecryptStringFromAlphabetToIntegerMapping: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.freqAlphabets("10#11#12"), "jkab")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.freqAlphabets("1326#"), "acz")
    }

}

private class Solution {

    private let keys: [[Character]] = [["1"], ["2"], ["3"], ["4"], ["5"], ["6"], ["7"], ["8"], ["9"],
                                       ["1", "0", "#"], ["1", "1", "#"], ["1", "2", "#"], ["1", "3", "#"],
                                       ["1", "4", "#"], ["1", "5", "#"], ["1", "6", "#"], ["1", "7", "#"],
                                       ["1", "8", "#"], ["1", "9", "#"], ["2", "0", "#"], ["2", "1", "#"],
                                       ["2", "2", "#"], ["2", "3", "#"], ["2", "4", "#"], ["2", "5", "#"],
                                       ["2", "6", "#"]]
    private let values = Array("abcdefghijklmnopqrstuvwxyz")
    
    func freqAlphabets(_ s: String) -> String {
        var result = [Character]()
        
        var code = [Character]()
        var string = Array(s)
        
        while string.isEmpty == false {
            code.append(string.removeLast())
            
            if let index = keys.firstIndex(of: code.reversed()) {
                result.insert(values[index], at: 0)
                code.removeAll(keepingCapacity: true)
            }
        }
        
        return String(result)
    }
}
