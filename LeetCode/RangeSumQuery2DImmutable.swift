//
//  RangeSumQuery2DImmutable.swift
//  https://leetcode.com/problems/range-sum-query-2d-immutable/
//
//  Created by Erik Radicheski da Silva on 12/12/22.
//

import XCTest

final class RangeSumQuery2DImmutable: XCTestCase {
    
    private var list: NumMatrix!
    
    func testExampleA() {
        let commands = ["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
        let inputs: [[Any]] = [[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
        let outputs = [nil, 8, 11, 12]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [Any], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "NumMatrix":
                createInstances(inputs[index] as! [[[Int]]])
                
            case "sumRegion":
                let arg = inputs[index] as! [Int]
                let output = list.sumRegion(arg[0], arg[1], arg[2], arg[3])
                XCTAssertEqual(output, outputs[index]!)
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
        }
    }
    
    func createInstances(_ matrix: [[[Int]]]) {
        list = NumMatrix(matrix[0])
    }

}

private class NumMatrix {
    
    private var sum: [[Int]]
    
    init(_ matrix: [[Int]]) {
        sum = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        
        for (rowIndex, rowValue) in matrix.enumerated() {
            for (columnIndex, columnValue) in rowValue.enumerated() {
                sum[rowIndex + 1][columnIndex + 1] = sum[rowIndex + 1][columnIndex] + sum[rowIndex][columnIndex + 1] + columnValue - sum[rowIndex][columnIndex]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        sum[row2 + 1][col2 + 1] - sum[row1][col2 + 1] - sum[row2 + 1][col1] + sum[row1][col1]
    }
}
