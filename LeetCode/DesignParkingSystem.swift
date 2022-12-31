//
//  DesignParkingSystem.swift
//  https://leetcode.com/problems/design-parking-system/
//
//  Created by Erik Radicheski da Silva on 31/12/22.
//

import XCTest

final class DesignParkingSystem: XCTestCase {
    
    private var parkingLot: ParkingSystem!
    var array = [Int]()
    
    func testExampleA() {
        let commands = ["ParkingSystem", "addCar", "addCar", "addCar", "addCar"]
        let inputs = [[1, 1, 0], [1], [2], [3], [1]]
        let outputs = [nil, true, true, false, false]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Int]], resultingIn outputs: [Bool?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "ParkingSystem":
                createInstances(inputs[index])
                
            case "addCar":
                XCTAssertEqual(parkingLot.addCar(inputs[index][0]), outputs[index]!)
            
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
            
        }
    }
    
    func createInstances(_ args: [Int]) {
        parkingLot = ParkingSystem(args[0], args[1], args[2])
    }
}

private class ParkingSystem {
    
    private let numberOfSlots: [Int]
    private var parkedCars = [0, 0, 0]
    
    init(_ big: Int, _ medium: Int, _ small: Int) {
        numberOfSlots = [small, medium, big]
    }
    
    func addCar(_ carType: Int) -> Bool {
        if parkedCars[3 - carType] == numberOfSlots[3 - carType] {
            return false
        }
        
        parkedCars[3 - carType] += 1
        return true
    }
}
