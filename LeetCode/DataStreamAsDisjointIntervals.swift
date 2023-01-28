//
//  DataStreamAsDisjointIntervals.swift
//  https://leetcode.com/problems/data-stream-as-disjoint-intervals/
//
//  Created by Erik Radicheski da Silva on 28/01/23.
//

import XCTest

final class DataStreamAsDisjointIntervals: XCTestCase {
    
    // TODO: Test cases

}

private class SummaryRanges {
    
    private var ranges = [ClosedRange<Int>]()
    
    func addNum(_ value: Int) {
        let newRange = value ... value
        let extendedRange = value - 1 ... value + 1
        
        if let index = ranges.firstIndex(where: { $0.lowerBound >= newRange.lowerBound } ) {
            guard ranges[index].contains(value) == false else { return }
            
            ranges.insert(value ... value, at: index)
            
            if ranges.indices.contains(index + 1) {
                if ranges[index + 1].overlaps(extendedRange) {
                    let newMin = min(newRange.lowerBound, ranges[index + 1].lowerBound)
                    let newMax = max(newRange.upperBound, ranges[index + 1].upperBound)
                    ranges[index] = newMin ... newMax
                    let _ = ranges.remove(at: index + 1)
                }
            }
            
            if ranges.indices.contains(index - 1) {
                if ranges[index - 1].overlaps(extendedRange) {
                    let newMin = min(ranges[index].lowerBound, ranges[index - 1].lowerBound)
                    let newMax = max(ranges[index].upperBound, ranges[index - 1].upperBound)
                    ranges[index - 1] = newMin ... newMax
                    let _ = ranges.remove(at: index)
                }
            }
            
        } else {
            ranges.append(value ... value)
            if ranges.count > 1 && ranges[ranges.endIndex - 2].overlaps(extendedRange) {
                let newMin = min(ranges[ranges.endIndex - 2].lowerBound, ranges[ranges.endIndex - 1].lowerBound)
                let newMax = max(ranges[ranges.endIndex - 2].upperBound, ranges[ranges.endIndex - 1].upperBound)
                ranges[ranges.endIndex - 2] = newMin ... newMax
                let _ = ranges.removeLast()
            }
        }
    }
    
    func getIntervals() -> [[Int]] {
        return ranges.map { [$0.lowerBound, $0.upperBound] }
    }
}
