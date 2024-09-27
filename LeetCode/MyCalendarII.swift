//
//  MyCalendarII.swift
//  https://leetcode.com/problems/my-calendar-ii/
//
//  Created by Erik Radicheski da Silva on 27/09/24.
//

import XCTest

final class MyCalendarII: XCTestCase {
}

private class MyCalendarTwo {
    
    private var bookings = Set<Range<Int>>()
    private var overlaps = Set<Range<Int>>()
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let range = start ..< end
        
        guard overlaps.allSatisfy({ range.overlaps($0) == false }) else { return false }
        
        overlaps.formUnion(bookings.map { range.clamped(to: $0) }.filter { $0.isEmpty == false })
        
        bookings.insert(range)
        
        return true
    }
}
