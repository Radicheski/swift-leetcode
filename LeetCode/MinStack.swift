//
//  MinStack.swift
//  https://leetcode.com/problems/min-stack/
//
//  Created by Erik Radicheski da Silva on 11/10/22.
//

import XCTest

final class MinStackTest: XCTestCase {
    
    private var stack = MinStack()

    func testExampleA() {
        let commands = ["MinStack", "push", "push", "push", "getMin", "pop", "top", "getMin"]
        let inputs = [[], [-2], [0], [-3], [], [], [], []]
        let outputs = [nil, nil, nil, nil, -3, nil, 0, -2]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Int]], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "MinStack":
                createInstances()
                
            case "push":
                push(inputs[index])
                
            case "pop":
                pop()
                
            case "top":
                XCTAssertEqual(top(), outputs[index])
                
            case "getMin":
                XCTAssertEqual(getMin(), outputs[index])
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
        }
    }
    
    func createInstances() {
        stack = MinStack()
    }
    
    func push(_ val: [Int]) {
        assert(val.count == 1)
        stack.push(val[0])
    }
    
    func pop() {
        stack.pop()
    }
    
    func top() -> Int {
        return stack.top()
    }
    
    func getMin() -> Int {
        return stack.getMin()
    }

}

private class MinStack {
    
    private var elements = [Int]()
    private var minElement = Int.max
    
    init() {
        
    }
    
    func push(_ val: Int) {
        if elements.isEmpty {
            minElement = val
            elements.append(val)
        } else {
            if val >= minElement {
                elements.append(val)
            } else {
                elements.append(2 * val - minElement)
                minElement = val
            }
        }
    }
    
    func pop() {
        let val = elements.removeLast()
        if val < minElement {
            minElement = 2 * minElement - val
        }
    }
    
    func top() -> Int {
        return max(elements.last!, minElement)
    }
    
    func getMin() -> Int {
        return minElement
    }
}
