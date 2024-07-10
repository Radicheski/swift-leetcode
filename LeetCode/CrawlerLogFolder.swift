//
//  CrawlerLogFolder.swift
//  https://leetcode.com/problems/crawler-log-folder/
//
//  Created by Erik Radicheski da Silva on 10/07/24.
//

import XCTest

final class CrawlerLogFolder: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minOperations(["d1/", "d2/", "../", "d21/", "./"]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minOperations(["d1/", "d2/", "./", "d3/", "../", "d31/"]), 3)
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.minOperations(["d1/", "../", "../", "../"]), 0)
    }
    
}

private class Solution {
    func minOperations(_ logs: [String]) -> Int {
        var pwd = [String]()
        
        for log in logs {
            guard log != "./" else { continue }
            
            if log == "../" {
                let _ = pwd.popLast()
            } else {
                pwd.append(log)
            }
            
        }
        
        return pwd.count
    }
}
