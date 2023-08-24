//
//  TextJustification.swift
//  https://leetcode.com/problems/text-justification/
//
//  Created by Erik Radicheski da Silva on 24/08/23.
//

import XCTest

final class TextJustification: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.fullJustify(["This", "is", "an", "example", "of", "text",
                                             "justification."], 16), [
                                                "This    is    an",
                                                "example  of text",
                                                "justification.  "
                                             ])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.fullJustify(["What", "must", "be", "acknowledgment", "shall", "be"], 16),
                       [
                         "What   must   be",
                         "acknowledgment  ",
                         "shall be        "
                       ])
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.fullJustify(["Science", "is", "what", "we", "understand", "well",
                                             "enough", "to", "explain", "to", "a", "computer.", "Art",
                                             "is", "everything", "else", "we", "do"], 20),
                                              [
                                                "Science  is  what we",
                                                "understand      well",
                                                "enough to explain to",
                                                "a  computer.  Art is",
                                                "everything  else  we",
                                                "do                  "
                                              ])
    }
    
}

private class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var words = words.map(Array.init)
        
        var lines = [[[Character]]]()
        
        for word in words {
            guard lines.isEmpty == false else {
                lines.append([word])
                continue
            }
            
            let lastIndex = lines.endIndex - 1
            
            if lines[lastIndex].map(\.count).reduce(into: word.count + 1, +=) <= maxWidth {
                lines[lastIndex].append([" "] + word)
            } else {
                lines.append([word])
            }
        }
        
        let lastIndex = lines.endIndex - 1
        
        for i in 0 ..< lastIndex {
            if lines[i].count == 1 {
                lines[i][0].append(contentsOf: Array(repeating: " ", count: maxWidth - lines[i][0].count))
            } else {
                var index = 1
                while lines[i].map(\.count).reduce(into: 0, +=) < maxWidth {
                    lines[i][index].insert(" ", at: 0)
                    index += 1
                    if lines[i].indices.contains(index) == false { index = 1 }
                }
            }
        }
        
        lines[lastIndex].append(Array(repeating: " ", count: lines[lastIndex].map(\.count).reduce(into: maxWidth, -=)))
    
        return lines.map { String($0.joined()) }
    }
}
