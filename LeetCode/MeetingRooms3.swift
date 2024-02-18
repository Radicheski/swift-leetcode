//
//  MeetingRooms3.swift
//  https://leetcode.com/problems/meeting-rooms-iii/
//
//  Created by Erik Radicheski da Silva on 18/02/24.
//

import XCTest

final class MeetingRooms3: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.mostBooked(2, [[0, 10], [1, 5], [2, 7], [3, 4]]), 0)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.mostBooked(3, [[1, 20], [2, 10], [3, 5], [4, 9], [6, 8]]), 1)
    }
    
}

private class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var roomAvailabilityTime = Array(repeating: 0, count: n)
        var meetingCount = Array(repeating: 0, count: n)
        
        let meetings = meetings.map { (start: $0[0], end: $0[1]) }.sorted { $0.start < $1.start }
        
        for (start, end) in meetings {
            var minRoomAvailabiliityTime = Int.max
            var minAvailableTimeRoom = 0
            var foundUnusedRoom = false
            
            for i in 0 ..< n {
                if roomAvailabilityTime[i] <= start {
                    foundUnusedRoom = true
                    meetingCount[i] += 1
                    roomAvailabilityTime[i] = end
                    break
                }
                
                if minRoomAvailabiliityTime > roomAvailabilityTime[i] {
                    minRoomAvailabiliityTime = roomAvailabilityTime[i]
                    minAvailableTimeRoom = i
                }
            }
            
            if foundUnusedRoom == false {
                roomAvailabilityTime[minAvailableTimeRoom] += end - start
                meetingCount[minAvailableTimeRoom] += 1
            }
        }
        
        var maxMeetingCount = 0
        var maxMeetingCountRoom = 0
        
        for i in 0 ..< n {
            if meetingCount[i] > maxMeetingCount {
                maxMeetingCount = meetingCount[i]
                maxMeetingCountRoom = i
            }
        }
        
        return maxMeetingCountRoom
    }
}
