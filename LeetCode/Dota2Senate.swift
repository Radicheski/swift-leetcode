//
//  Dota2Senate.swift
//  https://leetcode.com/problems/dota2-senate/
//
//  Created by Erik Radicheski da Silva on 04/05/23.
//

import XCTest

final class Dota2Senate: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.predictPartyVictory("RD"), "Radiant")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.predictPartyVictory("RDD"), "Dire")
    }
    
}

private class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        var senators = Array(senate)
        
        var index = 0
        
        while senators.count > 1 {
            index %= senators.count
            
            let senator = senators[index]
            
            for i in 1 ... senators.count {
                let opposingIndex = (index + i) % senators.count
                
                guard index != opposingIndex else { return senator == "R" ? "Radiant" : "Dire" }
                
                guard senator != senators[opposingIndex] else { continue }
                
                let _ = senators.remove(at: opposingIndex)
                
                if opposingIndex > index {
                    index += 1
                }
                
                break
            }
        }
        
        return senators[0] == "R" ? "Radiant" : "Dire"
    }
}
