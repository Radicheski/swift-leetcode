//
//  InsertDeleteGetRandom.swift
//  https://leetcode.com/problems/insert-delete-getrandom-o1/
//
//  Created by Erik Radicheski da Silva on 20/01/23.
//

import XCTest

final class InsertDeleteGetRandom: XCTestCase {

        // TODO: Test cases

}

private class RandomizedSet {
    
    private var set = Set<Int>()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        guard set.contains(val) == false else { return false }
        
        set.insert(val)
        
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard set.contains(val) else { return false }
        
        let _ = set.remove(val)
        
        return true
    }
    
    func getRandom() -> Int {
        set.randomElement()!
    }
}
