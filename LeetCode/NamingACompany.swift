//
//  NamingACompany.swift
//  https://leetcode.com/problems/naming-a-company/
//
//  Created by Erik Radicheski da Silva on 09/02/23.
//

import XCTest

final class NamingACompany: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.distinctNames(["coffee", "donuts", "time", "toffee"]), 6)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.distinctNames(["lack", "back"]), 0)
    }
    
}

private class Solution {
    func distinctNames(_ ideas: [String]) -> Int {
        var ideasGroups = [Character: Set<[Character]>]()
        
        for idea in ideas.map(Array.init) {
            ideasGroups[idea[0], default:[]].insert(Array(idea[1...]))
        }
        
        let keys: [Character] = ideasGroups.keys.map { $0 }
        
        var result = 0
        
        for i in 0 ..< keys.endIndex - 1 {
            guard let ideasA = ideasGroups[keys[i]] else { continue }
            
            for j in i + 1 ..< keys.endIndex {
                guard let ideasB = ideasGroups[keys[j]] else { continue }
                
                var mutualCount = 0
                
                for ideaA in ideasA {
                    if ideasB.contains(ideaA) {
                        mutualCount += 1
                    }
                }
                
                result += 2 * (ideasA.count - mutualCount) * (ideasB.count - mutualCount)
                
            }
        }
        
        return result
    }
}
