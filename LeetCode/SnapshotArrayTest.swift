//
//  SnapshotArray.swift
//  https://leetcode.com/problems/snapshot-array/
//
//  Created by Erik Radicheski da Silva on 11/06/23.
//

import XCTest

final class SnapshotArrayTest: XCTestCase {

    //TODO: Test cases

}

private class SnapshotArray {
    
    private var snapId = 0
    private var records: [[(snapId: Int, val: Int)]]
    
    init(_ length: Int) {
        records = Array(repeating: [(0, 0)], count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        records[index].append((snapId, val))
    }
    
    func snap() -> Int {
        defer { snapId += 1 }
        
        return snapId
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        return records[index].last(where: { $0.snapId <= snap_id } )!.val
    }
}
