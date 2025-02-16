//
//  ConstructTheLexicographicallyLargestValidSequence.swift
//  https://leetcode.com/problems/construct-the-lexicographically-largest-valid-sequence/
//
//  Created by Erik Radicheski da Silva on 16/02/25.
//

import XCTest

final class ConstructTheLexicographicallyLargestValidSequence: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.constructDistancedSequence(3), [3, 1, 2, 3, 2])
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.constructDistancedSequence(5), [5, 3, 1, 4, 3, 5, 2, 4, 2])
    }
    
}

private class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var answer: [Int?] = Array(repeating: nil, count: 2 * n - 1)
        var usedNumbers = Set<Int>()
        
        let _ = createSequence(0, &answer, n, &usedNumbers)
        
        return answer.compactMap(\.self)
    }
    
    private func createSequence(_ currentIndex: Int, _ sequence: inout [Int?], _ targetNumber: Int,
                                _ usedNumbers: inout Set<Int>) -> Bool {
        if currentIndex == sequence.count { return true }
        
        if let _ = sequence[currentIndex] {
            return createSequence(currentIndex + 1, &sequence, targetNumber, &usedNumbers)
        }
        
        for numberToPlace in (1 ... targetNumber).reversed() {
            if usedNumbers.contains(numberToPlace) { continue }
            
            usedNumbers.insert(numberToPlace)
            sequence[currentIndex] = numberToPlace
            
            if numberToPlace == 1 {
                if createSequence(currentIndex + 1, &sequence, targetNumber, &usedNumbers) {
                    return true
                }
            } else if sequence.indices.contains(currentIndex + numberToPlace) && sequence[currentIndex + numberToPlace] == nil {
                sequence[currentIndex + numberToPlace] = numberToPlace
                
                if createSequence(currentIndex + 1, &sequence, targetNumber, &usedNumbers) {
                    return true
                }
                
                sequence[currentIndex + numberToPlace] = nil
            }
            
            sequence[currentIndex] = nil
            usedNumbers.remove(numberToPlace)
        }
        
        return false
    }
}
