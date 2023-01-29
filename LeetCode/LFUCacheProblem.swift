//
//  LFUCacheProblem.swift
//  https://leetcode.com/problems/lfu-cache/description/
//
//  Created by Erik Radicheski da Silva on 29/01/23.
//

import XCTest

final class LFUCacheProblem: XCTestCase {

    // TODO: Test cases

}

private class LFUCache {
    
    private var cache = [Int: (frequency: Int, value: Int)]()
    private var frequencies = [Int: [Int]]()
    private var minFrequency = 0
    private var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let (frequency, value) = cache[key] else { return -1 }
        
        frequencies[frequency]?.removeAll(where: { $0 == key } )
        
        let newFrequency = frequency + 1
        
        frequencies[newFrequency, default: []].append(key)
        
        cache[key] = (newFrequency, value)
        
        if frequencies[minFrequency, default: []].isEmpty {
            minFrequency += 1
        }
        
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        
        if let (frequency, _) = cache[key] {
            frequencies[frequency, default: []].removeAll(where:  { $0 == key } )
            
            let newFrequency = frequency + 1
            
            frequencies[newFrequency, default: []].append(key)
            
            cache[key] = (newFrequency, value)
            
            if frequencies[minFrequency, default: []].isEmpty {
                minFrequency += 1
            }
        } else {
            if cache.count == capacity {
                if let key = frequencies[minFrequency]?.first {
                    cache.removeValue(forKey: key)
                    frequencies[minFrequency]?.removeFirst()
                }
            }
            
            minFrequency = 1
            cache[key] = (minFrequency, value)
            frequencies[minFrequency, default: []].append(key)
        }
    }
}
