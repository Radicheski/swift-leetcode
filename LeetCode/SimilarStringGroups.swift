//
//  SimilarStringGroups.swift
//  https://leetcode.com/problems/similar-string-groups/
//
//  Created by Erik Radicheski da Silva on 28/04/23.
//

import XCTest

final class SimilarStringGroups: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.numSimilarGroups(["tars", "rats", "arts", "star"]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.numSimilarGroups(["omv", "ovm"]), 1)
    }
    
}

private class Solution {
    func numSimilarGroups(_ strs: [String]) -> Int {
        let strs = strs.map(Array.init)
        let length = strs.count
        
        var adj = [Int: [Int]]()
        
        for i in 0 ..< length {
            for j in i + 1 ..< length {
                if isSimilar(strs[i], strs[j]) {
                    adj[i, default: []].append(j)
                    adj[j, default: []].append(i)
                }
            }
        }
        
        var visit = Array(repeating: false, count: length)
        var count = 0
        
        for i in 0 ..< length {
            if visit[i] == false {
                depthFirst(i, adj, &visit)
                count += 1
            }
        }
        
        return count        
    }
    
    private func isSimilar(_ a: [Character], _ b: [Character]) -> Bool {
        var diff = 0
        
        for i in a.indices {
            guard diff < 3 else { return false }
            
            if a[i] != b[i] {
                diff += 1
            }
        }
        
        return diff == 0 || diff == 2
    }
    
    private func depthFirst(_ node: Int, _ adj: [Int: [Int]], _ visit: inout [Bool]) {
        visit[node] = true
        
        guard let neighbors = adj[node] else { return }
        
        for neighbor in neighbors {
            if visit[neighbor] == false {
                visit[neighbor] = true
                depthFirst(neighbor, adj, &visit)
            }
        }
    }
    
}
