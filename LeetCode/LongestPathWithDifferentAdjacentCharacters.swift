//
//  LongestPathWithDifferentAdjacentCharacters.swift
//  https://leetcode.com/problems/longest-path-with-different-adjacent-characters/
//
//  Created by Erik Radicheski da Silva on 13/01/23.
//

import XCTest

final class LongestPathWithDifferentAdjacentCharacters: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.longestPath([-1, 0, 0, 1, 1, 2], "abacbe"), 3)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.longestPath([-1, 0, 0, 0], "aabc"), 3)
    }

}

private class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        var longestPath = 1
        
        var children = [Int: [Int]]()
        
        for i in 1 ..< parent.endIndex {
            children[parent[i], default: []].append(i)
        }
        
        let _ = depthFirst(0, children, Array(s), &longestPath)
        
        return longestPath
    }
    
    private func depthFirst(_ currentNode: Int,
                    _ children: [Int: [Int]],
                    _ string: [Character],
                    _ longestPath: inout Int) -> Int {
        guard let currentChihildren = children[currentNode] else { return 1 }
        
        var longestChain = 0
        var secondLongestChain = 0
        
        for child in currentChihildren {
            let longestChainStartingFromChild = depthFirst(child, children, string, &longestPath)
            
            guard string[currentNode] != string[child] else { continue }
            
            if longestChainStartingFromChild > longestChain {
                secondLongestChain = longestChain
                longestChain = longestChainStartingFromChild
            } else if longestChainStartingFromChild > secondLongestChain {
                secondLongestChain = longestChainStartingFromChild
            }
        }
        
        longestPath = max(longestPath, longestChain + secondLongestChain + 1)
        return longestChain + 1
    }
}
