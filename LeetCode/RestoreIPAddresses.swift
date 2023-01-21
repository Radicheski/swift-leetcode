//
//  RestoreIPAddresses.swift
//  https://leetcode.com/problems/restore-ip-addresses/
//
//  Created by Erik Radicheski da Silva on 21/01/23.
//

import XCTest

final class RestoreIPAddresses: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        let output = Set(solution.restoreIpAddresses("25525511135"))
        let expectedOutput = Set(["255.255.11.135", "255.255.111.35"])
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleB() {
        let output = Set(solution.restoreIpAddresses("0000"))
        let expectedOutput = Set(["0.0.0.0"])
        XCTAssertEqual(output, expectedOutput)
    }
    
    func testExampleC() {
        let output = Set(solution.restoreIpAddresses("101023"))
        let expectedOutput = Set(["1.0.10.23", "1.0.102.3", "10.1.0.23", "10.10.2.3", "101.0.2.3"])
        XCTAssertEqual(output, expectedOutput)
    }
    
}

private class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let s = Array(s)
        
        guard s.count > 3 && s.count < 13 else { return [] }
        
        var ans = [String]()
        
        for i in 1 ..< s.endIndex - 2 {
            for j in i + 1 ..< s.endIndex - 1 {
                for k in j + 1 ..< s.endIndex {
                    let ip = [s[..<i], s[i..<j], s[j..<k], s[k...]]
                    if valid(ip) {
                        ans.append(ip.map { String($0) }.joined(separator: "."))
                    }
                }
            }
        }
        
        return ans
    }
    
    private func valid(_ ip: [Array<String.Element>.SubSequence]) -> Bool {
        guard ip.allSatisfy( { $0.count < 4 } ) else { return false }
        
        guard ip.map( { String($0) } ).allSatisfy( { $0 == "0" || $0.starts(with: "0") == false } ) else { return false }
        
        return ip.compactMap { Int(String($0)) }.allSatisfy { $0 < 256 }
    }
}
