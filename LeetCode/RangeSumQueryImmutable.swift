//
//  RangeSumQueryImmutable.swift
//  https://leetcode.com/problems/range-sum-query-immutable/
//
//  Created by Erik Radicheski da Silva on 31/12/22.
//

import XCTest

final class RangeSumQueryImmutable: XCTestCase {

    private var range: NumArray!
    var array = [Int]()
    
    func testExampleA() {
        let commands = ["NumArray", "sumRange", "sumRange", "sumRange"]
        let inputs = [[-2, 0, 3, -5, 2, -1], [0, 2], [2, 5], [0, 5]]
        let outputs = [nil, 1, -1, -3]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Int]], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "NumArray":
                createInstances(inputs[index])
                
            case "sumRange":
                XCTAssertEqual(sumRange(inputs[index]), outputs[index]!)
            
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
            
        }
    }
    
    func createInstances(_ args: [Int]) {
        range = NumArray(args)
    }
    
    func sumRange(_ args: [Int]) -> Int {
        range.sumRange(args[0], args[1])
    }
    
}

private class NumArray {
    
    private let preffixSum: [Int]
    private let nums: [Int]
    
    init(_ nums: [Int]) {
        var parcialSum = [Int]()
        var sum = 0
        
        for num in nums {
            sum += num
            parcialSum.append(sum)
        }
        
        preffixSum = parcialSum
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preffixSum[right] - preffixSum[left] + nums[left]
    }
}
