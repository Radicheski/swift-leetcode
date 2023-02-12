//
//  DesignAddAndSearchWordsDataStructure.swift
//  https://leetcode.com/problems/design-add-and-search-words-data-structure/
//
//  Created by Erik Radicheski da Silva on 11/02/23.
//

import XCTest

final class DesignAddAndSearchWordsDataStructure: XCTestCase {
    
    func testAdd() {
        let wordDictionary = WordDictionary()
        
        measure {
            for _ in 0 ..< 10_000 {
                wordDictionary.addWord(newWord)
            }
        }
    }
    
    func testSearch() {
        let wordDictionary = WordDictionary()
        
        var words = [String]()
        
        for _ in 0 ..< 10_000 {
            words.append(newWord)
        }
        
        let oldWords = Set(words)
        
        while words.isEmpty == false {
            wordDictionary.addWord(words.removeLast())
        }
        
        for _ in 0 ..< 10_000 {
            words.append(newWord)
        }
        
        for word in words {
            XCTAssertEqual(wordDictionary.search(word), oldWords.contains(word))
        }

        measure {
            for word in words {
                let _ = wordDictionary.search(word)
            }
        }
    }
    
    private var newWord: String {
        let letters = Array("abcdefghijklmnopqrstuvwxyz")
        
        var result = [Character]()
        
        for _ in 0 ..< 25 {
            result.append(letters.randomElement()!)
        }
        
        return String(result)
    }
}

private class WordDictionary {
    
    private var words = [Character: WordDictionary]()
    private var whole = false
    
    init() {
        
    }
    
    func addWord(_ word: String) {
        var dictionary = self
        
        for character in word {
            let newDictionary = dictionary.words[character, default: .init()]
            dictionary.words[character] = newDictionary
            dictionary = newDictionary
        }
        
        dictionary.whole = true
    }
    
    func search(_ word: String) -> Bool {
        let word = Array(word)
        
        var queue = [(index: 0, dictionary: self)]
        
        while queue.isEmpty == false {
            let (index, dictionary) = queue.removeLast()
            
            guard word.indices.contains(index) else {
                if dictionary.whole {
                    return true
                } else {
                    continue
                }
            }
            
            if word[index] == "." {
                for (_, newDictionary) in dictionary.words {
                    queue.append((index + 1, newDictionary))
                }
            } else {
                if let newDictionary = dictionary.words[word[index]] {
                    queue.append((index + 1, newDictionary))
                }
            }
        }
        
        return false
    }
    
}
