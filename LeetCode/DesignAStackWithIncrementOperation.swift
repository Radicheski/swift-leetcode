//
//  DesignAStackWithIncrementOperation.swift
//  https://leetcode.com/problems/design-a-stack-with-increment-operation/
//
//  Created by Erik Radicheski da Silva on 30/09/24.
//

import XCTest

final class DesignAStackWithIncrementOperation: XCTestCase {
}

private class CustomStack {
    
    private var maxSize: Int
    private var stack = [Int]()
    
    init(_ maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func push(_ x: Int) {
        guard stack.count < maxSize else { return }
        stack.append(x)
    }
    
    func pop() -> Int {
        return stack.popLast() ?? -1
    }
    
    func increment(_ k: Int, _ val: Int) {
        for i in 0 ..< k {
            guard stack.indices.contains(i) else { return }
            stack[i] += val
        }
    }
}
