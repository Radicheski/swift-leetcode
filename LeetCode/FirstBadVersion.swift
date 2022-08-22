//
//  FirstBadVersion.swift
//  https://leetcode.com/problems/first-bad-version/
//
//  Created by Erik Radicheski da Silva on 22/08/22.
//

import XCTest

class FirstBadVersion: XCTestCase {

    func test() {
        let solution = Solution()
        
        solution.badVersion = 4
        XCTAssertEqual(solution.firstBadVersion(5), solution.badVersion)
        
        solution.badVersion = 1
        XCTAssertEqual(solution.firstBadVersion(1), solution.badVersion)
    }

}

private class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var firstVersion = 1
        var lastVersion = n
        
        while firstVersion < lastVersion {
            let middleVersion = (firstVersion + lastVersion) / 2
            if isBadVersion(middleVersion) {
                lastVersion = middleVersion
            } else {
                firstVersion = middleVersion + 1
            }
        }
        
        return firstVersion
    }
}

private class VersionControl {
    var badVersion = 0
    
    func isBadVersion(_ version: Int) -> Bool {
        return version >= badVersion
    }
    
}
