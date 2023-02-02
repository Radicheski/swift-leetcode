//
//  DistantBarcodes.swift
//  https://leetcode.com/problems/distant-barcodes/
//
//  Created by Erik Radicheski da Silva on 02/02/23.
//

import XCTest

final class DistantBarcodes: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = [1, 1, 1, 2, 2, 2]
        let output = solution.rearrangeBarcodes(input)
        
        XCTAssertEqual(input.sorted(), output.sorted())
        
        for i in 1 ..< output.endIndex {
            XCTAssertFalse(output[i - 1] == output[i])
        }
    }
    
    func testExampleB() {
        let input = [1, 1, 1, 1, 2, 2, 3, 3]
        let output = solution.rearrangeBarcodes(input)
        
        XCTAssertEqual(input.sorted(), output.sorted())
        
        for i in 1 ..< output.endIndex {
            XCTAssertFalse(output[i - 1] == output[i])
        }
    }

}

private class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        let numbers = Dictionary(barcodes.map { ($0, 1) }, uniquingKeysWith: +)
            .sorted { $0.value > $1.value }.flatMap { Array(repeating: $0.key, count: $0.value) }

        let middle = (numbers.count + 1) / 2
        var split = [[Int]]()
        split.append(Array(numbers[..<middle]))
        split.append(Array(numbers[middle...]))
        
        var result = Array(repeating: 0, count: barcodes.count)
        
        for i in result.indices {
            result[i] = split[i % 2].removeFirst()
        }
        
        return result
    }
}
