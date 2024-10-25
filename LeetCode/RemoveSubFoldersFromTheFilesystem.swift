//
//  RemoveSubFoldersFromTheFilesystem.swift
//  https://leetcode.com/problems/remove-sub-folders-from-the-filesystem/
//
//  Created by Erik Radicheski da Silva on 25/10/24.
//

import XCTest

final class RemoveSubFoldersFromTheFilesystem: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.removeSubfolders(["/a", "/a/b", "/c/d", "/c/d/e", "/c/f"]), ["/a", "/c/d", "/c/f"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.removeSubfolders(["/a", "/a/b/c", "/a/b/d"]), ["/a"])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.removeSubfolders(["/a/b/c", "/a/b/ca", "/a/b/d"]), ["/a/b/c", "/a/b/ca", "/a/b/d"])
    }
    
}

private class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let folder = folder.sorted()
        var result = [String]()
        
        for path in folder {
            if let last = result.last, path.hasPrefix(last + "/") { continue }
            
            result.append(path)
        }
        
        return result
    }
}
