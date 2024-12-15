//
//  MaximumAveragePassRatio.swift
//  https://leetcode.com/problems/maximum-average-pass-ratio/
//
//  Created by Erik Radicheski da Silva on 15/12/24.
//

import XCTest

final class MaximumAveragePassRatio: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.maxAverageRatio([[1, 2], [3, 5], [2, 2]], 2), 0.78333, accuracy: 1e-5)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.maxAverageRatio([[2, 4], [3, 9], [4, 5], [2, 10]], 4), 0.53485, accuracy: 1e-5)
    }
    
}

private class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        var heap = [(gain: Double, passes: Int, total: Int)]()
        
        for cls in classes {
            let pass = cls[0]
            let total = cls[1]
            let gain = calculateGain(pass, total)
            append((gain, pass, total), &heap)
        }
        
        for _ in 0 ..< extraStudents {
            let (_, pass, total) = remove(&heap)
            append((calculateGain(pass + 1, total + 1), pass + 1, total + 1), &heap)
        }
        
        let ratioSum = heap.reduce(into: 0) { $0 += Double($1.passes) / Double($1.total) }
        
        return ratioSum / Double(classes.count)
    }
    
    private func append(_ cls: (gain: Double, passes: Int, total: Int),
                        _ classes: inout [(gain: Double, passes: Int, total: Int)]) {
        classes.append(cls)
        
        var index = classes.endIndex - 1
        while index > 0 {
            let parent = (index - 1) / 2
            if classes[index].gain > classes[parent].gain {
                classes.swapAt(index, parent)
                index = parent
            } else {
                break
            }
        }
    }
    
    private func remove(_ classes: inout [(gain: Double, passes: Int, total: Int)]) -> (gain: Double, passes: Int, total: Int) {
        let lastClass = classes[0]
        classes[0] = classes.removeLast()
        
        var index = 0
        let count = classes.count
        while true {
            let left = 2 * index + 1
            let right = 2 * index + 2
            var candidate = index
            
            if left < count && classes[left].gain > classes[candidate].gain {
                candidate = left
            }
            if right < count && classes[right].gain > classes[candidate].gain {
                candidate = right
            }
            if candidate == index { break }
            classes.swapAt(index, candidate)
            index = candidate
        }
        
        return lastClass
    }
    
    private func calculateGain(_ pass: Int, _ total: Int) -> Double {
        let pass = Double(pass)
        let total = Double(total)
        
        return (pass + 1) / (total + 1) - pass / total
    }
}
