//
//  RepeatedDNASequences.swift
//  https://leetcode.com/problems/repeated-dna-sequences/
//
//  Created by Erik Radicheski da Silva on 06/10/22.
//

import XCTest

final class RepeatedDNASequences: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        let output = solution.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
        let expectedOutput = ["AAAAACCCCC","CCCCCAAAAA"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }
    
    func testExampleB() {
        let output = solution.findRepeatedDnaSequences("AAAAAAAAAAAAA")
        let expectedOutput = ["AAAAAAAAAA"]
        XCTAssertEqual(output.count, expectedOutput.count)
        XCTAssertEqual(Set(output), Set(expectedOutput))
    }
    }
        
}

private class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let array = Array(s)
        
        guard array.count > 10 else { return [] }

        var result = [[Character]: Int]()
        
        for index in 0 ... array.count - 10 {
            let key = Array(array[index ..< index + 10])
            if var count =  result[key] {
                count += 1
                result[key] = count
            } else {
                result[key] = 0
            }
        }
        
        return result.filter { $0.value > 0 }.map { String($0.key) }
    }
}
