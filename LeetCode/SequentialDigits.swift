//
//  SequentialDigits.swift
//  https://leetcode.com/problems/sequential-digits/
//
//  Created by Erik Radicheski da Silva on 02/02/24.
//

import XCTest

final class SequentialDigits: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.sequentialDigits(100, 300), [123, 234])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.sequentialDigits(1000, 13000), [1234, 2345, 3456, 4567, 5678, 6789, 12345])
    }
}

private class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        let lowDigits = numberOfDigits(low)
        let highDigits = numberOfDigits(high)
        
        var answer = [Int]()
        
        for digit in lowDigits ... highDigits {
            var (number, increment) = sequence(digit)
            
            while (1 ... 9).contains(number % 10) {
                if (low ... high).contains(number) { answer.append(number) }
                number += increment
            }
        }
        
        return answer
    }
    
    private func numberOfDigits(_ number: Int) -> Int {
        var answer = 0
        var number = number
        
        while number > 0 {
            answer += 1
            number /= 10
        }
        
        return answer
    }
    
    private func sequence(_ digits: Int) -> (start: Int, increment: Int) {
        var start = 0
        var increment = 0
        
        for i in 1 ... digits {
            start *= 10
            start += i
            
            increment *= 10
            increment += 1
        }
        
        return (start, increment)
    }
}
