//
//  CompareVersionNumbers.swift
//  https://leetcode.com/problems/compare-version-numbers/
//
//  Created by Erik Radicheski da Silva on 03/05/24.
//

import XCTest

final class CompareVersionNumbers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.compareVersion("1.01", "1.001"), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.compareVersion("1.0", "1.0.0"), 0)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.compareVersion("0.1", "1.1"), -1)
    }
    
}

private class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var version1 = version1.split(separator: ".").compactMap { Int($0) }
        var version2 = version2.split(separator: ".").compactMap { Int($0) }
    
        if version2.count > version1.count {
            version1.append(contentsOf: Array(repeating: 0, count: version2.count - version1.count))
        } else if version1.count > version2.count {
            version2.append(contentsOf: Array(repeating: 0, count: version1.count - version2.count))
        }
        
        for i in version1.indices {
            if version1[i] < version2[i] { return -1 }
            if version1[i] > version2[i] { return  1 }
        }
        
        return 0
    }
}
