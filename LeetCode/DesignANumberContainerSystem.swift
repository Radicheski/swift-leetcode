//
//  DesignANumberContainerSystem.swift
//  https://leetcode.com/problems/design-a-number-container-system/?envType=daily-question&envId=2025-02-08
//
//  Created by Erik Radicheski da Silva on 08/02/25.
//

import XCTest

final class DesignANumberContainerSystem: XCTestCase {
}

private class NumberContainers {
    
    private var containers = [Int: Int]()
    private var indices = [Int: Set<Int>]()
    
    func change(_ index: Int, _ number: Int) {
        if let previousNumber = containers[index] {
            indices[previousNumber]?.remove(index)
        }
        
        containers[index] = number
        indices[number, default: []].insert(index)
    }
    
    func find(_ number: Int) -> Int {
        return indices[number]?.min() ?? -1
    }
}
