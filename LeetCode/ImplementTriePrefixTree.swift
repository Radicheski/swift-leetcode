//
//  ImplementTriePrefixTree.swift
//  https://leetcode.com/problems/implement-trie-prefix-tree/
//
//  Created by Erik Radicheski da Silva on 24/11/22.
//

import XCTest

final class ImplementTriePrefixTree: XCTestCase {

    private var stack = Trie()

    func testExampleA() {
        let commands = ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
        let inputs = [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
        let outputs = [nil, nil, true, false, true, nil, true]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[String]], resultingIn outputs: [Bool?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "Trie":
                createInstances()
                
            case "insert":
                insert(inputs[index])
                
            case "search":
                XCTAssertEqual(search(inputs[index]), outputs[index])
                
            case "startsWith":
                XCTAssertEqual(startsWith(inputs[index]), outputs[index])
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
        }
    }
    
    func createInstances() {
        stack = Trie()
    }
    
    func insert(_ val: [String]) {
        assert(val.count == 1)
        stack.insert(val[0])
    }
    
    func search(_ val: [String]) -> Bool{
        stack.search(val[0])
    }
    
    func startsWith(_ val: [String]) -> Bool {
        stack.startsWith(val[0])
    }

}

private class Trie {
    
    private let root: TrieNode? = TrieNode()
    
    func insert(_ word: String) {
        var node = root
        let word = Array(word)
        
        for character in word {
            if node?.containsKey(character) == false {
                node?.put(character, TrieNode())
            }
            node = node?.get(character)
        }
        
        node?.setEnd()
    }
    
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node = root
        var word = Array(word)
        
        for character in word {
            if node?.containsKey(character) == true {
                node = node?.get(character)
            } else {
                return nil
            }
        }
        
        return node
    }
    
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node?.isEnd ?? false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        searchPrefix(prefix) != nil
    }
    
    private class TrieNode {
        private var links = [Character: TrieNode]()
        
        private static let R = 26
        
        private(set) var isEnd = false
        
        func containsKey(_ key: Character) -> Bool {
            links[key] != nil
        }
        
        func get(_ key: Character) -> TrieNode? {
            links[key]
        }
        
        func put(_ key: Character, _ node: TrieNode) {
            links[key] = node
        }
        
        func setEnd() {
            isEnd = true
        }
        
    }
}

