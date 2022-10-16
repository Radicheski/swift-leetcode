//
//  KeysAndRooms.swift
//  https://leetcode.com/problems/keys-and-rooms/
//
//  Created by Erik Radicheski da Silva on 16/10/22.
//

import XCTest

final class KeysAndRooms: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canVisitAllRooms([[1], [2], [3], []]))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canVisitAllRooms([[1, 3], [3, 0, 1], [2], [0]]))
    }

}

private class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var rooms = Dictionary(uniqueKeysWithValues: rooms.enumerated().map { ($0, $1) } )
        var keys = Set([0])
        
        while keys.intersection(rooms.keys).isEmpty == false {
            if let key = rooms.keys.first(where: keys.contains) {
                if let newKeys = rooms.removeValue(forKey: key) {
                    keys = keys.union(newKeys)
                }
            }
        }
        
        return rooms.isEmpty
    }
}
