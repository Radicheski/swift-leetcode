//
//  ReplaceWords.swift
//  https://leetcode.com/problems/replace-words/
//
//  Created by Erik Radicheski da Silva on 07/06/24.
//

import XCTest

final class ReplaceWords: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.replaceWords(["cat", "bat", "rat"], "the cattle was rattled by the battery"), "the cat was rat by the bat")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.replaceWords(["a", "b", "c"], "aadsfasf absbs bbab cadsfafs"), "a a b c")
    }
    
}

private class Solution {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let trie = TrieNode()
        
        for root in dictionary {
            var node = trie
            
            for letter in root {
                if let nextNode = node.get(letter) {
                    node = nextNode
                } else {
                    node = node.put(letter, node: .init())
                }
            }
            
            node.isRoot = true
        }
        
        var sentence = sentence.split(separator: " ").map(String.init)
        
        for (i, word) in sentence.enumerated() {
            var node = trie
            var root = [Character]()
            
            for letter in word {
                guard let nextNode = node.get(letter) else { break }
                
                node = nextNode
                root.append(letter)
                guard node.isRoot == false else { break }
            }
            
            guard node.isRoot else { continue }
            
            sentence[i] = String(root)
        }
        
        return sentence.joined(separator: " ")
    }
}

private class TrieNode {
    private var links = [Character: TrieNode]()
    var isRoot: Bool = false
    
    func get(_ letter: Character) -> TrieNode? { links[letter] }
    
    func put(_ letter: Character, node: TrieNode) -> TrieNode {
        links[letter] = node
        return node
    }
}
