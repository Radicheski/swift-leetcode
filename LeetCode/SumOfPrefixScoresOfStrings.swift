//
//  SumOfPrefixScoresOfStrings.swift
//  https://leetcode.com/problems/sum-of-prefix-scores-of-strings/
//
//  Created by Erik Radicheski da Silva on 25/09/24.
//

import XCTest

final class SumOfPrefixScoresOfStrings: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sumPrefixScores(["abc", "ab", "bc", "b"]), [5, 4, 3, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sumPrefixScores(["abcd"]), [4])
    }
    
}

private class Solution {
    func sumPrefixScores(_ words: [String]) -> [Int] {
        let words = words.map(Array.init)
        let root = TrieNode()
        
        for word in words {
            insert(word, root)
        }
        
        return words.map { count($0, root) }
    }
    
    private func insert(_ word: [Character], _ root: TrieNode) {
        var node = root
        
        for character in word {
            if node.next[character] == nil { node.next[character] = TrieNode() }
            node.next[character]!.count += 1
            node = node.next[character]!
        }
    }
    
    private func count(_ word: [Character], _ root: TrieNode)  -> Int {
        var node = root
        var answer = 0
        
        for character in word {
            answer += node.next[character]!.count
            node = node.next[character]!
        }
        
        return answer
    }
}

private class TrieNode {
    var next = [Character: TrieNode]()
    var count = 0
}
