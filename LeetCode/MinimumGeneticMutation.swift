//
//  MinimumGeneticMutation.swift
//  https://leetcode.com/problems/minimum-genetic-mutation/
//
//  Created by Erik Radicheski da Silva on 01/02/23.
//

import XCTest

final class MinimumGeneticMutation: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"]), 1)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA", "AACCGCTA", "AAACGGTA"]), 2)
    }

}

private class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        let endGene = Array(endGene)
        let bank = bank.map { Array($0) }
        
        var queue = [Array(startGene)]
        var seen = Set(queue)
        
        var steps = 0
        
        while queue.isEmpty == false {
            let size = queue.count
            
            for _ in 0 ..< size {
                let node = queue.removeFirst()
                
                if node == endGene {
                    return steps
                }
                
                for c in Array("ACGT") {
                    for i in 0 ..< node.endIndex {
                        var neighbor = node
                        neighbor[i] = c
                        
                        if seen.contains(neighbor) == false && bank.contains(neighbor) {
                            queue.append(neighbor)
                            seen.insert(neighbor)
                        }
                    }
                }
            }
            
            steps += 1
        }
        
        return -1
    }
}
