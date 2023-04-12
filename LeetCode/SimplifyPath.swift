//
//  SimplifyPath.swift
//  https://leetcode.com/problems/simplify-path/
//
//  Created by Erik Radicheski da Silva on 12/04/23.
//

import XCTest

final class SimplifyPath: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.simplifyPath("/home/"), "/home")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.simplifyPath("/../"), "/")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.simplifyPath("/home//foo/"), "/home/foo")
    }

}

private class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String.SubSequence]()
        
        for directory in path.split(separator: "/") {
            guard directory != "" else { continue }
            guard directory != "." else { continue }
            
            if directory == ".." {
                if stack.isEmpty == false {
                    let _ = stack.removeLast()
                }
            } else {
                stack.append(directory)
            }
        }
        
        return "/\(stack.joined(separator: "/"))"
    }
}
