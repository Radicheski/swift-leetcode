//
//  DesignAuthenticationManager.swift
//  https://leetcode.com/problems/design-authentication-manager/
//
//  Created by Erik Radicheski da Silva on 19/01/23.
//

import XCTest

final class DesignAuthenticationManager: XCTestCase {

    private var manager: AuthenticationManager!
    
    func testExampleA() {
        let commands = ["AuthenticationManager", "renew", "generate", "countUnexpiredTokens", "generate", "renew", "renew", "countUnexpiredTokens"]
        let inputs = [[5], ["aaa", 1], ["aaa", 2], [6], ["bbb", 7], ["aaa", 8], ["bbb", 10], [15]]
        let outputs = [nil, nil, nil, 1, nil, nil, nil, 0]
        execute(commands, with: inputs, resultingIn: outputs)
    }
    
    func execute(_ commands: [String], with inputs: [[Any]], resultingIn outputs: [Int?]) {
        assert(commands.count == inputs.count)
        assert(inputs.count == outputs.count)
        
        for (index, command) in commands.enumerated() {
            
            switch command {
                
            case "AuthenticationManager":
                createInstances(inputs[index] as! [Int])
                
            case "generate":
                generate(inputs[index])
                
            case "renew":
                renew(inputs[index])
                
            case "countUnexpiredTokens":
                XCTAssertEqual(countUnexpiredTokens(inputs[index] as! [Int]), outputs[index])
                
            default:
                XCTFail("Command \"\(command)\" not recognized.")
            }
        }
    }
    
    func createInstances(_ args: [Int]) {
        assert(args.count == 1)
        manager = AuthenticationManager(args[0])
    }
    
    func generate(_ args: [Any]){
        assert(args.count == 2)
        manager.generate(args[0] as! String, args[1] as! Int)
    }
    
    func renew(_ args: [Any]) {
        assert(args.count == 2)
        manager.renew(args[0] as! String, args[1] as! Int)
    }
    
    func countUnexpiredTokens(_ args: [Int]) -> Int {
        assert(args.count == 1)
        return manager.countUnexpiredTokens(args[0])
    }

}

private class AuthenticationManager {
    
    private let ttl: Int
    
    private var tokens = [String: Int]()
    
    init(_ timeToLive: Int) {
        ttl = timeToLive
    }
    
    func generate(_ tokenId: String, _ currentTime: Int) {
        tokens[tokenId] = currentTime + ttl
    }
    
    func renew(_ tokenId: String, _ currentTime: Int) {
        guard let expirationTime = tokens[tokenId] else { return }
        guard expirationTime > currentTime else { return }
        generate(tokenId, currentTime)
    }
    
    func countUnexpiredTokens(_ currentTime: Int) -> Int {
        return tokens.values.filter { $0 > currentTime }.count
    }
}
