//
//  StreamOfCharacters.swift
//  https://leetcode.com/problems/stream-of-characters/
//
//  Created by Erik Radicheski da Silva on 26/02/23.
//

import XCTest

final class StreamOfCharacters: XCTestCase {
    
    func testExampleA() {
        let streamChecker = StreamChecker(["cd", "f", "kl"])
        
        XCTAssertFalse(streamChecker.query("a"))
        XCTAssertFalse(streamChecker.query("b"))
        XCTAssertFalse(streamChecker.query("c"))
        XCTAssertTrue(streamChecker.query("d"))
        XCTAssertFalse(streamChecker.query("e"))
        XCTAssertTrue(streamChecker.query("f"))
        XCTAssertFalse(streamChecker.query("g"))
        XCTAssertFalse(streamChecker.query("h"))
        XCTAssertFalse(streamChecker.query("i"))
        XCTAssertFalse(streamChecker.query("j"))
        XCTAssertFalse(streamChecker.query("k"))
        XCTAssertTrue(streamChecker.query("l"))
    }
    
}

private class StreamChecker {
    
    private var buffer = [Character]()
    private let words = WordChecker()
    
    init(_ words: [String]) {
        for word in words {
            self.words.add(word)
        }
    }
    
    func query(_ letter: Character) -> Bool {
        buffer.insert(letter, at: 0)
        return words.check(buffer)
    }
    
    private class WordChecker {
        
        private var wholeWord = false
        private var words = [Character: WordChecker]()
        
        func add(_ word: String) {
            guard word.isEmpty == false else { return }
            
            var node = self
            
            for letter in Array(word).reversed()  {
                if let checker = node.words[letter] {
                    node = checker
                } else {
                    let checker = WordChecker()
                    node.words[letter] = checker
                    node = checker
                }
            }
            
            node.wholeWord = true
        }
        
        func check(_ word: [Character]) -> Bool {
            guard wholeWord == false else { return true }
            
            var node = self
            
            for letter in word {
                guard let nextNode = node.words[letter] else { break }
                guard nextNode.wholeWord == false else { return true }
                node = nextNode
            }
            
            return node.wholeWord
        }
        
    }
}
