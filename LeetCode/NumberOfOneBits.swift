//
//  NumberOfOneBits.swift
//  testLeetcode
//
//  Created by Erik Radicheski da Silva on 26/09/22.
//

import XCTest

final class NumberOfOneBits: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let input = Int(bitPattern: UInt("00000000000000000000000000001011", radix: 2)!)
        XCTAssertEqual(solution.hammingWeight(input), 3)
    }
    
    func testExampleB() {
        let input = Int(bitPattern: UInt("00000000000000000000000010000000", radix: 2)!)
        XCTAssertEqual(solution.hammingWeight(input), 1)
    }
    
    func testExampleC() {
        let input = Int(bitPattern: UInt("11111111111111111111111111111101", radix: 2)!)
        XCTAssertEqual(solution.hammingWeight(input), 31)
    }

}

private class Solution {
    
    func hammingWeight(_ n: Int) -> Int {
        var sum = 0
        
        for i in 0 ..< 32 {
            if n & 1 << i > 0 {
                sum += 1
            }
        }
        
        return sum
    }
    
}
