//
//  TopKFrequentWords.swift
//  https://leetcode.com/problems/top-k-frequent-words/
//
//  Created by Erik Radicheski da Silva on 30/08/22.
//

import XCTest

class TopKFrequentWords: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.topKFrequent(["i","love","leetcode","i","love","coding"], 2), ["i","love"])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.topKFrequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4), ["the","is","sunny","day"])
    }

}

private class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        let result = words.reduce(into: [:]) { result, word in
            result[word, default: 0] += 1
        }.sorted { (wordA: (key: String, value: Int), wordB: (key: String, value: Int)) in
            if wordA.value == wordB.value {
                return wordA.key < wordB.key
            } else {
                return wordA.value > wordB.value
            }
        }.reduce(into: []) {
            $0.append($1.key)
        }
        
        return Array(result[0 ..< k])
    }
}
