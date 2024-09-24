//
//  FindTheLengthOfTheLongestCommonPrefix.swift
//  https://leetcode.com/problems/find-the-length-of-the-longest-common-prefix/
//
//  Created by Erik Radicheski da Silva on 24/09/24.
//

import XCTest

final class FindTheLengthOfTheLongestCommonPrefix: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestCommonPrefix([1, 10, 100], [1000]), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestCommonPrefix([1, 2, 3], [4, 4, 4]), 0)
    }
    
}

private class Solution {
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var prefix1 = prefixes(arr1)
        var prefix2 = prefixes(arr2)
        
        var maxLength = 0
        
        for prefix in prefix2 {
            if prefix1.contains(prefix) {
                maxLength = max(maxLength, prefix.count)
            }
        }
        
        return maxLength
    }
    
    private func prefixes(_ arr: [Int]) -> Set<[Character]> {
        let arr = arr.map(String.init).map(Array.init)
        var set = Set<[Character]>()
        
        for num in arr {
            for i in 1 ... num.count {
                set.insert(Array(num.prefix(i)))
            }
        }
        
        return set
    }
}
