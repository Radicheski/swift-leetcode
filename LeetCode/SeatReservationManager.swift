//
//  SeatReservationManager.swift
//  https://leetcode.com/problems/seat-reservation-manager/
//
//  Created by Erik Radicheski da Silva on 17/01/23.
//

import XCTest

final class SeatReservationManager: XCTestCase {
    
    private var manager: SeatManager!
    var array = [Int]()
    
    func testExampleA() {
        let commands = ["SeatManager", "reserve", "reserve", "unreserve",
                        "reserve", "reserve", "reserve", "reserve", "unreserve"]
        let inputs = [[5], [], [], [2], [], [], [], [], [5]]
        let outputs = [nil, 1, 2, nil, 2, 3, 4, 5, nil]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Int]], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "SeatManager":
                createInstances(inputs[index])
                
            case "reserve":
                XCTAssertEqual(reserve(), outputs[index])
                
            case "unreserve":
                unreserve(inputs[index])
            
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
            
        }
    }
    
    func createInstances(_ args: [Int]) {
        manager = SeatManager(args[0])
    }
    
    func reserve() -> Int {
        manager.reserve()
    }
    
    func unreserve(_ args: [Int]) {
        manager.unreserve(args[0])
    }
    
}

private class SeatManager {
    
    private var availableSeats: [Bool]
    
    init(_ n: Int) {
        availableSeats = Array(repeating: true, count: n)
    }
    
    func reserve() -> Int {
        guard let seatNumber = availableSeats.firstIndex(of: true) else { fatalError() }
        availableSeats[seatNumber] = false
        return seatNumber + 1
    }
    
    func unreserve(_ seatNumber: Int) {
        availableSeats[seatNumber - 1] = true
    }
    
}
