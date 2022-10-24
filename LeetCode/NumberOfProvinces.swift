//
//  NumberOfProvinces.swift
//  https://leetcode.com/problems/number-of-provinces/
//
//  Created by Erik Radicheski da Silva on 24/10/22.
//

import XCTest

final class NumberOfProvinces: XCTestCase {

    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertEqual(solution.findCircleNum([[1, 1, 0], [1, 1, 0], [0, 0, 1]]), 2)
    }
    
    func testExampleB() {
        XCTAssertEqual(solution.findCircleNum([[1, 0, 0], [0, 1, 0], [0, 0, 1]]), 3)
    }

}

private class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard isConnected.count > 1 else { return 1 }
        
        var provinceCount = 0
        
        var isVisited = isConnected.map { _ in false }
        
        for i in 0 ..< isConnected.endIndex {
            if isVisited[i] { continue }
            
            searchConnected(isConnected, &isVisited, i)
            
            provinceCount += 1
        }
        
        return provinceCount
    }
    
    private func searchConnected(_ isConnected: [[Int]], _ isVisited: inout [Bool], _ origin: Int) {
        for j in 0 ..< isConnected.endIndex {
            if isVisited[j] == false && isConnected[origin][j] == 1 {
                isVisited[j] = true
                searchConnected(isConnected, &isVisited, j)
            }
        }
    }
}
