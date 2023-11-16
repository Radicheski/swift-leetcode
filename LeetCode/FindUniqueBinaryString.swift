//
//  FindUniqueBinaryString.swift
//  https://leetcode.com/problems/find-unique-binary-string/
//
//  Created by Erik Radicheski da Silva on 16/11/23.
//

import XCTest

final class FindUniqueBinaryString: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findDifferentBinaryString(["01", "10"]), "11")
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findDifferentBinaryString(["00", "01"]), "11")
    }
    
    func testExampleC() {
        XCTAssertEqual(solution.findDifferentBinaryString(["111", "011", "001"]), "101")
    }

}

private class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let set = Set(nums)
        var answer = ""
        
        for i in 0 ... (1 << nums.count) {
            answer = binaryString(i, nums.count)
            if set.contains(answer) == false { break }
        }
        
        return answer
    }
    
    private func binaryString(_ num: Int, _ bits: Int) -> String {
        var answer: [Character] = Array(repeating: "0", count: bits)
        
        for i in 0 ..< bits {
            if num & (1 << i) > 0 {
                answer[bits - i - 1] = "1"
            }
        }
        
        return String(answer)
    }
}
