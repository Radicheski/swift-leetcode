//
//  MyCalendarI.swift
//  https://leetcode.com/problems/my-calendar-i/
//
//  Created by Erik Radicheski da Silva on 20/01/23.
//

import XCTest

final class MyCalendarI: XCTestCase {

    // TODO: Test cases
    
}

private class MyCalendar {
    
    private var events = [Range<Int>]()
    
    init() {
        
    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let newEvent = start ..< end
        
        for event in events where event.overlaps(newEvent) {
            return false
        }
        
        events.append(newEvent)
        
        return true
    }
}
