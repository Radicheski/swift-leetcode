//
//  CanPlaceFlowers.swift
//  https://leetcode.com/problems/can-place-flowers/
//
//  Created by Erik Radicheski da Silva on 20/03/23.
//

import XCTest

final class CanPlaceFlowers: XCTestCase {
    
    private let solution = Solution()
    
    func testExampleA() {
        XCTAssertTrue(solution.canPlaceFlowers([1, 0, 0, 0, 1], 1))
    }
    
    func testExampleB() {
        XCTAssertFalse(solution.canPlaceFlowers([1, 0, 0, 0, 1], 2))
    }
    
}

private class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var remainingFlowers = n
        
        for (i, element) in flowerbed.enumerated() {
            guard remainingFlowers > 0 else { return true }
            
            guard element == 0 else { continue }
            guard flowerbed.indices.contains(i - 1) == false || flowerbed[i - 1] == 0 else { continue }
            guard flowerbed.indices.contains(i + 1) == false || flowerbed[i + 1] == 0 else { continue }
            
            flowerbed[i] = 1
            remainingFlowers -= 1
        }
        
        return remainingFlowers == 0
    }
}
